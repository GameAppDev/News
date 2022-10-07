//
//  FavsPresenter.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import Foundation

final class FavsPresenter {
    
    private weak var view: FavsViewController?
    private var interactor: FavsInteractor?
    private var router: FavsRouter?
    
    public var favNews: [NewsArticle] = []
    
    init(view: FavsViewController, interactor: FavsInteractor, router: FavsRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension FavsPresenter: PFavsViewToPresenter {
    
    func navigateToDetail(news: NewsArticle?) {
        guard let selectedNews = news else {
            router?.showAlert(message: "Please select a news")
            return
        }
        router?.openDetailVC(news: selectedNews)
    }
    
    func viewDidLoad() {
        view?.setupViews()
        view?.setupCollectionView()
    }
    
    func viewWillAppear() {
        view?.setNavBar()
        interactor?.fetchFavNewsData()
    }
}

extension FavsPresenter: PFavsInteractorToPresenter {
    
    func onSuccessFavNews(response: [NewsArticle]) {
        self.favNews = response
        view?.reloadCollectionView()
    }
}
