//
//  DetailContractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import Foundation

protocol PDetailPresenterToView: PresenterToView {
    
    func setupTableView()
    
    func setupFavButton(isFav: Bool)
}

protocol PDetailViewToPresenter: ViewToPresenter {
    
    func navigateToWebView(newsUrl: String?)
    
    func setFavNewsStatus()
}

protocol PDetailPresenterToInteractor {
    
    func getFavNewsStatus(news: NewsArticle)
    
    func setFavNews(news: NewsArticle, isFav: Bool)
}

protocol PDetailInteractorToPresenter {
    
    func onSuccessFavStatus(isFav: Bool)
}

protocol PDetailPresenterToRouter: PresenterToRouter {
   
    func openWebVC(url: URL)
    
    func showAlert(message: String)
}
