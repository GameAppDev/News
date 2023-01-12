//
//  FavsInteractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import Foundation

final class FavsInteractor {
    
    weak var presenter: PFavsInteractorToPresenter?
    
    private var favNews: [NewsArticle] = []
    private var apiState: ApiState = .beforeRequest
}

extension FavsInteractor: PFavsPresenterToInteractor {
    
    // MARK: - Fetch
    func fetchData<T>(request: T) {
        self.favNews = CoreDataManager.shared.getFavouriteNews()
        presenter?.setData(data: self.favNews)
    }
    
    // MARK: - Get
    func getFavNews() -> [NewsArticle] {
        return self.favNews
    }
}
