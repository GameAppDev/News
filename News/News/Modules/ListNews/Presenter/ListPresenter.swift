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
    
    public var news: [NewsArticle] = []
    
    public var isLoadMore: Bool = true
    public var page: Int = 1
    public var searchedKey: String = ""
    
    init(view: ListViewController, interactor: ListInteractor, router: ListRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    private func resetSearchStatus() {
        news.removeAll()
        page = 1
        searchedKey = ""
    }
}

extension ListPresenter: PListViewToPresenter {
    
    func getNews(isNewSearch: Bool) {
        guard searchedKey != "" else { return }
        isLoadMore = true
        
        isNewSearch ? (page = 1) : (page += 1)
        isNewSearch ? (news.removeAll()) : ()
        
        let params: NewsPost = NewsPost(searchedKey: searchedKey, page: page)
        interactor?.fetchNewsData(params: params)
    }
    
    func navigateToDetail(news: NewsArticle?) {
        guard let selectedNews = news else {
            router?.showAlert(message: "Please select a news")
            return
        }
        router?.openDetailVC(news: selectedNews)
    }
    
    func viewDidLoad() {
        view?.setupViews()
        view?.setupTableView()
    }
    
    func viewWillAppear() {
        view?.setNavBar()
    }
}

extension ListPresenter: PListInteractorToPresenter {
    
    func onSuccessNews(response: [NewsArticle]) {
        isLoadMore = false
        news.append(contentsOf: response)
        view?.reloadTableView()
    }
    
    func onErrorNews(error: BaseError) {
        isLoadMore = false
        resetSearchStatus()
        view?.reloadTableView()
        router?.showAlert(message: error.errorMessage ?? "Try again".localized)
    }
}
