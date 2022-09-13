//
//  DetailContractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import Foundation

protocol PDetailPresenterToView: PresenterToView {
    
    func setupTableView()
}

protocol PDetailViewToPresenter: ViewToPresenter {
    
    func favNews()
    
    func navigateToWebView(newsUrl: String?)
}

protocol PDetailPresenterToInteractor { }

protocol PDetailInteractorToPresenter { }

protocol PDetailPresenterToRouter: PresenterToRouter {
   
    func openWebVC(url: URL)
    
    func showAlert(message: String)
}
