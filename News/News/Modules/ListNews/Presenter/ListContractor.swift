//
//  ListContractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation

protocol PListPresenterToView: PresenterToView {
    
    func becomeFirstResponderLanguageTextField()
    
    func resignFirstResponderLanguageTextField()
}

protocol PListViewToPresenter: ViewToPresenter {
    
    func getNews(request: NewsPost)
    
    func navigateToDetail()
}

protocol PListPresenterToInteractor {
    
    func fetchNewsData(request: NewsPost)
}

protocol PListInteractorToPresenter {
    
    func onSuccessNews(response: [NewsArticle])
    
    func onErrorNews(error: BaseError)
}

protocol PListPresenterToRouter: PresenterToRouter {
   
    func openDetailVC()
}
