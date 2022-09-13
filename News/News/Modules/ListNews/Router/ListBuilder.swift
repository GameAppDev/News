//
//  ListBuilder.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation
import UIKit

struct ListBuilder {

    static func buildModule() -> UINavigationController {
        let viewController = ListViewController()
        
        let interactor = ListInteractor()
        let router = ListRouter()
        let presenter = ListPresenter(view: viewController, interactor: interactor, router: router)
        
        let navigationController = UINavigationController(rootViewController: viewController)
        router.navigationController = navigationController
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        
        return navigationController
    }
}
