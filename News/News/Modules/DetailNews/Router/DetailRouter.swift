//
//  DetailRouter.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import Foundation
import UIKit

final class DetailRouter {
    
    public func returnVC(news: NewsArticle) -> UIViewController {
        return DetailBuilder.buildModule(news: news)
    }
}

extension DetailRouter: PDetailPresenterToRouter {
    
    func openWebVC(url: URL) {
        let webVC = WebRouter().returnVC(url: url)
        AppRouter.shared.pushVC(webVC, animated: true)
    }
    
    func showAlert(message: String) {
        if let navigationController = AppRouter.shared.navigationController {
            showAlert(from: navigationController, message: message)
        }
    }
}
