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
    
    public var selectedNews: NewsArticle?
    private var isFav: Bool = false
    
    init(view: DetailViewController, interactor: DetailInteractor, router: DetailRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: PDetailViewToPresenter {
    
    func viewDidLoad() {
        view?.setupViews()
        view?.setupTableView()
        if let news = selectedNews {
            interactor?.getFavNewsStatus(news: news)
        }
    }
    
    func viewWillAppear() {
        view?.setNavBar()
    }
    
    func navigateToWebView(newsUrl: String?) {
        guard let url = URL(string: newsUrl ?? "") else {
            router?.showAlert(message: "The news does not has a source url")
            return
        }
        router?.openWebVC(url: url)
    }
    
    func setFavNewsStatus() {
        guard let news = selectedNews else {
            router?.showAlert(message: "Try again")
            return
        }
        interactor?.setFavNews(news: news, isFav: !isFav)
    }
}

extension DetailPresenter: PDetailInteractorToPresenter {
    
    func onSuccessFavStatus(isFav: Bool) {
        self.isFav = isFav
        view?.setupFavButton(isFav: isFav)
    }
}
