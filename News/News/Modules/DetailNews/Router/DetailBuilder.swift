//
//  DetailBuilder.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import UIKit

struct DetailBuilder {

    static func buildModule(news: NewsArticle) -> UIViewController {
        let viewController = DetailViewController()
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(view: viewController, interactor: interactor, router: router)
        let tableViewConnector = DetailNewsTableView(presenter: presenter)
        
        viewController.presenter = presenter
        viewController.tableViewConnector = tableViewConnector
        
        interactor.presenter = presenter
        interactor.selectedNews = news
        
        return viewController
    }
}
