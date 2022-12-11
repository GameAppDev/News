//
//  ListBuilder.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

struct ListBuilder {

    static func buildModule() -> UIViewController {
        let viewController = ListViewController()
        let interactor = ListInteractor()
        let router = ListRouter()
        let presenter = ListPresenter(view: viewController, interactor: interactor, router: router)
        let tableViewConnector = ListNewsTableView(presenter: presenter)
        
        viewController.presenter = presenter
        viewController.tableViewConnector = tableViewConnector
        
        interactor.presenter = presenter
        
        return viewController
    }
}
