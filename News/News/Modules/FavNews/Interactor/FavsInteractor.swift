//
//  FavsInteractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import Foundation

final class FavsInteractor {
    
    weak var presenter: FavsPresenter?
    
    private var favNews: [NewsArticle] = []
    public var apiState: ApiState = .beforeRequest
}

extension FavsInteractor: PFavsPresenterToInteractor {
    
    // MARK: - Fetch
    func fetchData<T>(request: T) {
        let favNews = CoreDataManager().getFavouriteNews()
        self.favNews = favNews
        presenter?.setData(data: favNews)
    }
    
    // MARK: - Get
    func getFavNews() -> [NewsArticle] {
        return self.favNews
    }
}
