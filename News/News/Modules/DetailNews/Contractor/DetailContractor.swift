//
//  DetailContractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import Foundation

protocol PDetailPresenterToView: PresenterToView {
    func setTableView(isHidden: Bool)
    func setFavButton(isFav: Bool)
}

protocol PDetailViewToPresenter: ViewToPresenter {
    func getSelectedNews() -> NewsArticle?
    func handleWebView()
    func handleFavNewsStatus()
}

protocol PDetailPresenterToInteractor: PresenterToInteractor {
    func getSelectedNews() -> NewsArticle?
    func getFavNewsStatus(news: NewsArticle)
    func setFavNews(news: NewsArticle, isFav: Bool)
}

protocol PDetailInteractorToPresenter: InteractorToPresenter { }

protocol PDetailPresenterToRouter: PresenterToRouter {
    func navigateToWebVC(with url: URL)
}
