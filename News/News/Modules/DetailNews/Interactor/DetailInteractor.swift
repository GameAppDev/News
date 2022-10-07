//
//  DetailInteractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import Foundation

final class DetailInteractor: Interactorable {
    
    public weak var presenter: DetailPresenter?
    
    public var apiState: ApiState = .beforeRequest
}

extension DetailInteractor: PDetailPresenterToInteractor {
    
    func getFavNewsStatus(news: NewsArticle) {
        let isFav: Bool = CoreDataManager().getSelectedNewsStatus(news)
        presenter?.onSuccessFavStatus(isFav: isFav)
    }
    
    func setFavNews(news: NewsArticle, isFav: Bool) {
        CoreDataManager().setFavouriteNews(with: news, isFav: isFav)
        presenter?.onSuccessFavStatus(isFav: isFav)
    }
}
