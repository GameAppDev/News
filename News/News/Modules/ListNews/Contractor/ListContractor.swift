//
//  ListContractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation

protocol PListPresenterToView: PresenterToView {
    func setTableView(isHidden: Bool)
}

protocol PListViewToPresenter: ViewToPresenter { }

protocol PListPresenterToInteractor: PresenterToInteractor {
    func getNews() -> [NewsArticle]
    func removeNews()
}

protocol PListInteractorToPresenter: InteractorToPresenter { }

protocol PListPresenterToRouter: PresenterToRouter {
    func navigateToDetail(with news: NewsArticle)
    func navigateToFav()
}

protocol PListConnectorToPresenter: ConnectorToPresenter {
    func handleNews(isNewSearch: Bool)
    func getNews() -> [NewsArticle]
    func handleDetail(index: Int)
    func handleFavNews()
    func getBusyStatus() -> Bool
    func setSearchedKey(text: String)
}
