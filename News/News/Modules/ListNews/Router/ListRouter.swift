//
//  ListRouter.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation
import UIKit

final class ListRouter {
    
    public func returnNC() -> UINavigationController {
        return ListBuilder.buildModule()
    }
}

extension ListRouter: PListPresenterToRouter {
    
    func openDetailVC(news: NewsArticle) {
        let detailVC = DetailRouter().returnVC(news: news)
        AppRouter.shared.pushVC(detailVC, animated: true)
    }
    
    func openFavNewsVC() {
        let favNewsVC = FavsRouter().returnVC()
        AppRouter.shared.pushVC(favNewsVC, animated: true)
    }
    
    func showAlert(message: String) {
        if let navigationController = AppRouter.shared.navigationController {
            showAlert(from: navigationController, message: message)
        }
    }
}
