//
//  ListPresenter.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation

final class ListPresenter {
    
    private weak var view: ListViewController?
    private var interactor: ListInteractor?
    private var router: ListRouter?
    
    private var isBusy: Bool = true
    private var page: Int = 1
    private var searchedKey: String = ""
    
    init(view: ListViewController, interactor: ListInteractor, router: ListRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func resetSearchStatus() {
        interactor?.removeNews()
        page = 1
    }
}

extension ListPresenter: PListViewToPresenter {
    
    // MARK: - ViewToPresenter
    func viewDidLoad() {
        view?.setTableView(isHidden: true)
    }
    
    func viewWillAppear() {
        view?.setNavBar(title: "NEWS".localized)
    }
    
    // MARK: - TableView
    func handleNews(isNewSearch: Bool) {
        guard searchedKey != "" else { return }
        
        isBusy = true
        view?.setActivityIndicator(isOn: true)
        
        isNewSearch ? (resetSearchStatus()) : (page += 1)
        
        let request: NewsPost = NewsPost(searchedKey: searchedKey, page: page)
        interactor?.fetchData(request: request)
    }
    
    func getNews() -> [NewsArticle] {
        return interactor?.getNews() ?? []
    }
    
    func handleDetail(index: Int) {
        guard let news = interactor?.getNews(),
              let selectedNews = news[safe: index] else {
            //Alert -- "Please select a news".localized
            return
        }
        router?.navigateToDetail(with: selectedNews)
    }
    
    func handleFavNews() {
        router?.navigateToFav()
    }
    
    func getBusyStatus() -> Bool {
        return self.isBusy
    }
    
    func setSearchedKey(text: String) {
        self.searchedKey = text
    }
}

extension ListPresenter: PListInteractorToPresenter {
    
    func setData<T>(data: T) {
        isBusy = false
        view?.setActivityIndicator(isOn: false)
        view?.setTableView(isHidden: false)
    }
    
    func setError(error: BaseError) {
        isBusy = false
        view?.setActivityIndicator(isOn: false)
        resetSearchStatus()
        view?.setTableView(isHidden: false)
        //Alert -- error.errorMessage ?? "Try again".localized
    }
}
