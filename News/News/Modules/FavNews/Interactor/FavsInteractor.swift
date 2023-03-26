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
}

extension FavsInteractor: PFavsPresenterToInteractor {
    
    // MARK: - Fetch
    func fetchData<T>(request: T) {
        favNews = CoreDataManager.shared.getFavouriteNews()
        presenter?.setData(data: favNews)
    }
    
    // MARK: - Get
    func getFavNews() -> [NewsArticle] {
        return favNews
    }
}
