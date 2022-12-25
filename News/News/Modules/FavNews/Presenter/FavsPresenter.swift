//
//  FavsPresenter.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import Foundation

final class FavsPresenter {
    
    private weak var view: PFavsPresenterToView?
    private var interactor: PFavsPresenterToInteractor?
    private var router: PFavsPresenterToRouter?
    
    init(view: PFavsPresenterToView,
         interactor: PFavsPresenterToInteractor,
         router: PFavsPresenterToRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension FavsPresenter: PFavsViewToPresenter {
    
    // MARK: - ViewToPresenter
    func viewDidLoad() {
        view?.setCollectionView(isHidden: true)
    }
    
    func viewWillAppear() {
        view?.setNavBar?(title: "FAV NEWS".localized)
        interactor?.fetchData(request: "")
    }
}

extension FavsPresenter: PFavsInteractorToPresenter {
    
    func setData<T>(data: T) {
        view?.setCollectionView(isHidden: false)
    }
    
    func setError(error: BaseError) {
        view?.setCollectionView(isHidden: false)
        view?.showAlert(message: error.errorMessage ?? "Try again".localized)
    }
}

extension FavsPresenter: PFavsConnectorToPresenter {
    
    func getFavNews() -> [NewsArticle] {
        return interactor?.getFavNews() ?? []
    }
    
    func handleDetail(index: Int) {
        guard let news = interactor?.getFavNews(),
              let selectedNews = news[safe: index] else {
            view?.showAlert(message: "Please select a news".localized)
            return
        }
        router?.navigateToDetail(with: selectedNews)
    }
}
