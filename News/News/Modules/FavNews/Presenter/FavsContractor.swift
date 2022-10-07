//
//  FavsContractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import Foundation

protocol PFavsPresenterToView: PresenterToView {
    
    func setupCollectionView()
    
    func reloadCollectionView()
}

protocol PFavsViewToPresenter: ViewToPresenter {
    
    func navigateToDetail(news: NewsArticle?)
}

protocol PFavsPresenterToInteractor {
    
    func fetchFavNewsData()
}

protocol PFavsInteractorToPresenter {
    
    func onSuccessFavNews(response: [NewsArticle])
}

protocol PFavsPresenterToRouter: PresenterToRouter {
   
    func openDetailVC(news: NewsArticle)
    
    func showAlert(message: String)
}
