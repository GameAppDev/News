//
//  WebPresenter.swift
//  News
//
//  Created by Oguzhan Yalcin on 14.09.2022.
//

import Foundation

final class WebPresenter {
    
    private weak var view: WebViewController?
    private var interactor: WebInteractor?
    private var router: WebRouter?
    
    public var url: URL?
    
    init(view: WebViewController, interactor: WebInteractor, router: WebRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension WebPresenter: PWebViewToPresenter {
    
    func viewDidLoad() {
        view?.setupViews()
        view?.loadWebView(url: url)
    }
    
    func viewWillAppear() {
        view?.setNavBar()
    }
}
