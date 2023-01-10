//
//  ListRouter.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import UIKit

final class ListRouter {
    
    public func returnVC() -> UIViewController {
        return ListBuilder.buildModule()
    }
}

extension ListRouter: PListPresenterToRouter {
    
    func navigateToDetail(with news: NewsArticle) {
        let detailVC = DetailRouter().returnVC(news: news)
        AppRouter.shared.pushVC(detailVC, animated: true)
    }
    
    func navigateToFav() {
        let favNewsVC = FavsRouter().returnVC()
        AppRouter.shared.pushVC(favNewsVC, animated: true)
    }
}
