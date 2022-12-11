//
//  DetailRouter.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import UIKit

final class DetailRouter {
    
    public func returnVC(news: NewsArticle) -> UIViewController {
        return DetailBuilder.buildModule(news: news)
    }
}

extension DetailRouter: PDetailPresenterToRouter {
    
    func navigateToWebVC(with url: URL) {
        let webVC = WebRouter().returnVC(url: url)
        AppRouter.shared.pushVC(webVC, animated: true)
    }
}
