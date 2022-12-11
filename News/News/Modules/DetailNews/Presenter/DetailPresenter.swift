//
//  DetailPresenter.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import Foundation

final class DetailPresenter {
    
    private weak var view: DetailViewController?
    private var interactor: DetailInteractor?
    private var router: DetailRouter?
    
    private var isFav: Bool = false
    
    init(view: DetailViewController, interactor: DetailInteractor, router: DetailRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: PDetailViewToPresenter {
    
    // MARK: - ViewToPresenter
    func viewDidLoad() {
        view?.setTableView(isHidden: true)
        if let news = interactor?.getSelectedNews() {
            interactor?.getFavNewsStatus(news: news)
        }
    }
    
    func viewWillAppear() {
        view?.setNavBar(title: "DETAIL".localized)
    }
    
    // MARK: - TableView
    func getSelectedNews() -> NewsArticle? {
        return interactor?.selectedNews
    }
    
    func handleWebView() {
        guard let news = interactor?.getSelectedNews(),
              let newsUrl = news.url,
              let url = URL(string: newsUrl) else {
            //Alert -- "The news does not has a source url".localized
            return
        }
        router?.navigateToWebVC(with: url)
    }
    
    func handleFavNewsStatus() {
        guard let news = interactor?.getSelectedNews() else {
            //Alert -- "Try again".localized
            return
        }
        interactor?.setFavNews(news: news, isFav: !isFav)
    }
}

extension DetailPresenter: PDetailInteractorToPresenter {
    
    func setData<T>(data: T) {
        guard let isFav = data as? Bool else { return }
        
        self.isFav = isFav
        view?.setTableView(isHidden: false)
        view?.setFavButton(isFav: isFav)
    }
    
    func setError(error: BaseError) {
        view?.setTableView(isHidden: false)
        //Alert -- error.errorMessage ?? "Try again".localized
    }
}
