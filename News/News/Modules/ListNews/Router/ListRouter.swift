//
//  ListRouter.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation
import UIKit

final class ListRouter: Routerable {
    
    weak var navigationController: UINavigationController?
    
    public func returnNC() -> UINavigationController {
        return ListBuilder.buildModule()
    }
}

extension ListRouter: PListPresenterToRouter {
    
    func openDetailVC() { }
    
    func showAlert(message: String) {
        showAlert(from: navigationController, message: message)
    }
}
