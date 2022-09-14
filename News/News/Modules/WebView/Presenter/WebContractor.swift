//
//  WebContractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 14.09.2022.
//

import Foundation

protocol PWebPresenterToView: PresenterToView {
    
    func loadWebView(url: URL?)
}

protocol PWebViewToPresenter: ViewToPresenter { }

protocol PWebPresenterToInteractor { }

protocol PWebInteractorToPresenter { }

protocol PWebPresenterToRouter: PresenterToRouter {
    
    func showAlert(message: String)
}
