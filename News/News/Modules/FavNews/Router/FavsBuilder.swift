//
//  FavsBuilder.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import Foundation
import UIKit

struct FavsBuilder {

    static func buildModule() -> UIViewController {
        let viewController = FavsViewController()
        
        let interactor = FavsInteractor()
        let router = FavsRouter()
        let presenter = FavsPresenter(view: viewController, interactor: interactor, router: router)
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        
        return viewController
    }
}
