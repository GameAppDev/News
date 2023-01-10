//
//  DetailPresenter.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import Foundation

final class DetailPresenter {
    
    private weak var view: PDetailPresenterToView?
    private var interactor: PDetailPresenterToInteractor?
    private var router: PDetailPresenterToRouter?
    
    private var isFav: Bool = false
    
    init(view: PDetailPresenterToView,
         interactor: PDetailPresenterToInteractor,
         router: PDetailPresenterToRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: PDetailViewToPresenter {
    
    func handleFavNewsStatus() {
        guard let news = interactor?.getSelectedNews() else {
            view?.showAlert(message: "Try again".localized)
            return
        }
        interactor?.setFavNews(news: news, isFav: !isFav)
    }
    
    // MARK: - ViewToPresenter
    func viewDidLoad() {
        view?.setTableView(isHidden: true)
        if let news = interactor?.getSelectedNews() {
            interactor?.getFavNewsStatus(news: news)
        }
    }
    
    func viewWillAppear() {
        view?.setNavBar?(title: "DETAIL".localized)
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
        view?.showAlert(message: error.errorMessage ?? "Try again".localized)
    }
}

extension DetailPresenter: PDetailConnectorToPresenter {
    
    func getSelectedNews() -> NewsArticle? {
        return interactor?.getSelectedNews()
    }
    
    func handleWebView() {
        guard let news = interactor?.getSelectedNews(),
              let newsUrl = news.url,
              let url = URL(string: newsUrl) else {
            view?.showAlert(message: "The news does not has a source url".localized)
            return
        }
        router?.navigateToWebVC(with: url)
    }
}
