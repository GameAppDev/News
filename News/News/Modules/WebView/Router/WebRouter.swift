//
//  WebRouter.swift
//  News
//
//  Created by Oguzhan Yalcin on 14.09.2022.
//

import Foundation
import UIKit

final class WebRouter: Routerable {
    
    weak var navigationController: UINavigationController?
    
    public func returnVC(navigationController: UINavigationController, url: URL) -> UIViewController {
        return WebBuilder.buildModule(navigationController: navigationController, url: url)
    }
}

extension WebRouter: PWebPresenterToRouter {
    
    func showAlert(message: String) {
        showAlert(from: navigationController, message: message)
    }
}
