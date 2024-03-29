//
//  WebBuilder.swift
//  News
//
//  Created by Oguzhan Yalcin on 14.09.2022.
//

import UIKit

struct WebBuilder {

    static func buildModule(url: URL) -> UIViewController {
        let viewController = WebViewController()
        let interactor = WebInteractor()
        let router = WebRouter()
        let presenter = WebPresenter(view: viewController,
                                     interactor: interactor,
                                     router: router)
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        interactor.url = url
        
        return viewController
    }
}
