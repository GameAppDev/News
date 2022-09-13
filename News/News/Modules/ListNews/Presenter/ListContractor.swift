//
//  ListContractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation

protocol PListPresenterToView: PresenterToView {
    
    func setupTableView()
    
    func reloadTableView()
}

protocol PListViewToPresenter: ViewToPresenter {
    
    func getNews(isNewSearch: Bool)
    
    func navigateToDetail(news: NewsArticle?)
}

protocol PListPresenterToInteractor {
    
    func fetchNewsData(params: NewsPost)
}

protocol PListInteractorToPresenter {
    
    func onSuccessNews(response: [NewsArticle])
    
    func onErrorNews(error: BaseError)
}

protocol PListPresenterToRouter: PresenterToRouter {
   
    func openDetailVC(news: NewsArticle)
    
    func showAlert(message: String)
}
