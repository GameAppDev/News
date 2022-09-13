//
//  DetailBuilder.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import Foundation
import UIKit

struct DetailBuilder {

    static func buildModule(navigationController: UINavigationController, news: NewsArticle) -> UIViewController {
        let viewController = DetailViewController()
        
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(view: viewController, interactor: interactor, router: router)
        
        presenter.selectedNews = news
        
        router.navigationController = navigationController
        
        viewController.presenter = presenter
        
        interactor.presenter = presenter
        
        return viewController
    }
}