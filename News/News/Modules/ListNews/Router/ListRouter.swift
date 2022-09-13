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
    
    func openDetailVC(news: NewsArticle) {
        pushVC(DetailRouter().returnVC(navigationController: (self.navigationController ?? UINavigationController()), news: news), navController: self.navigationController, animated: true)
    }
    
    func showAlert(message: String) {
        showAlert(from: self.navigationController, message: message)
    }
}
