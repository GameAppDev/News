//
//  FavsBuilder.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import UIKit

struct FavsBuilder {

    static func buildModule() -> UIViewController {
        let viewController = FavsViewController()
        let interactor = FavsInteractor()
        let router = FavsRouter()
        let presenter = FavsPresenter(view: viewController, interactor: interactor, router: router)
        let collectionViewConnector = FavNewsCollectionView(presenter: presenter)
        
        viewController.presenter = presenter
        viewController.collectionViewConnector = collectionViewConnector
        
        interactor.presenter = presenter
        
        return viewController
    }
}
