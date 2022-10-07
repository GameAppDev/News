//
//  FavsRouter.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import Foundation
import UIKit

final class FavsRouter {
    
    public func returnVC() -> UIViewController {
        return FavsBuilder.buildModule()
    }
}

extension FavsRouter: PFavsPresenterToRouter {
    
    func openDetailVC(news: NewsArticle) {
        let detailVC = DetailRouter().returnVC(news: news)
        AppRouter.shared.pushVC(detailVC, animated: true)
    }
    
    func showAlert(message: String) {
        if let navigationController = AppRouter.shared.navigationController {
            showAlert(from: navigationController, message: message)
        }
    }
}
