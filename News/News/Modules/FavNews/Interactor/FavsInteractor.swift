//
//  FavsInteractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 7.10.2022.
//

import Foundation

final class FavsInteractor: Interactorable {
    
    public weak var presenter: FavsPresenter?
    
    public var apiState: ApiState = .beforeRequest
}

extension FavsInteractor: PFavsPresenterToInteractor {
    
    func fetchFavNewsData() {
        let favNews = CoreDataManager().getFavouriteNews()
        presenter?.onSuccessFavNews(response: favNews)
    }
}
