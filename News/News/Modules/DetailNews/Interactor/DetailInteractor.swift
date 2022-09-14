//
//  DetailInteractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import Foundation

final class DetailInteractor: Interactorable {
    
    public var presenter: DetailPresenter?
    
    public var apiState: ApiState = .beforeRequest
}

extension DetailInteractor: PDetailPresenterToInteractor {
    
    func getFavNewsStatus() {
        //get Core Data Value
        presenter?.onSuccessFavStatus(isFav: false)
    }
    
    func setFavNews(isFav: Bool) {
        //set Core Data Value with isFav
        presenter?.onSuccessFavStatus(isFav: isFav)
    }
}
