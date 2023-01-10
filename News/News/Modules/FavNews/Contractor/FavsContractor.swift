//
//  FavsContractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import Foundation

protocol PFavsPresenterToView: PresenterToView {
    func setCollectionView(isHidden: Bool)
}

protocol PFavsViewToPresenter: ViewToPresenter { }

protocol PFavsPresenterToInteractor: PresenterToInteractor {
    func getFavNews() -> [NewsArticle]
}

protocol PFavsInteractorToPresenter: InteractorToPresenter { }

protocol PFavsPresenterToRouter: PresenterToRouter {
    func navigateToDetail(with news: NewsArticle)
}

protocol PFavsConnectorToPresenter: ConnectorToPresenter {
    func getFavNews() -> [NewsArticle]
    func handleDetail(index: Int)
}
