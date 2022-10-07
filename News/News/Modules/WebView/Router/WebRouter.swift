//
//  WebRouter.swift
//  News
//
//  Created by Oguzhan Yalcin on 14.09.2022.
//

import Foundation
import UIKit

final class WebRouter {
    
    public func returnVC(url: URL) -> UIViewController {
        return WebBuilder.buildModule(url: url)
    }
}

extension WebRouter: PWebPresenterToRouter {
    
    func showAlert(message: String) {
        if let navigationController = AppRouter.shared.navigationController {
            showAlert(from: navigationController, message: message)
        }
    }
}
