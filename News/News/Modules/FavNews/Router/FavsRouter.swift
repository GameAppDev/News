//
//  FavsRouter.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import UIKit

final class FavsRouter {
    
    public func returnVC() -> UIViewController {
        return FavsBuilder.buildModule()
    }
}

extension FavsRouter: PFavsPresenterToRouter {
    
    func navigateToDetail(with news: NewsArticle) {
        let detailVC = DetailRouter().returnVC(news: news)
        AppRouter.shared.pushVC(detailVC, animated: true)
    }
}
