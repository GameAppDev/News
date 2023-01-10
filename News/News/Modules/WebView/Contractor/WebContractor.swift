//
//  WebContractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 14.09.2022.
//

import Foundation

protocol PWebPresenterToView: PresenterToView {
    func setWebView(isHidden: Bool)
    func setWebView(url: URL?)
}

protocol PWebViewToPresenter: ViewToPresenter { }

protocol PWebPresenterToInteractor: PresenterToInteractor {
    func getNewsUrl() -> URL?
}

protocol PWebInteractorToPresenter: InteractorToPresenter { }

protocol PWebPresenterToRouter: PresenterToRouter { }
