//
//  DetailRouter.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import Foundation
import UIKit

final class DetailRouter: Routerable {
    
    weak var navigationController: UINavigationController?
    
    public func returnVC(navigationController: UINavigationController, news: NewsArticle) -> UIViewController {
        return DetailBuilder.buildModule(navigationController: navigationController, news: news)
    }
}

extension DetailRouter: PDetailPresenterToRouter {
    
    func openWebVC(url: URL) {
        pushVC(WebRouter().returnVC(navigationController: (self.navigationController ?? UINavigationController()), url: url), navController: self.navigationController, animated: true)
    }
    
    func showAlert(message: String) {
        showAlert(from: navigationController, message: message)
    }
}
