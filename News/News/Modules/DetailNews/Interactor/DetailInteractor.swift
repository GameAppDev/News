//
//  DetailInteractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 13.09.2022.
//

import Foundation

final class DetailInteractor {
    
    weak var presenter: PDetailInteractorToPresenter?
    var selectedNews: NewsArticle?
    
    private var apiState: ApiState = .beforeRequest
}

extension DetailInteractor: PDetailPresenterToInteractor {
    
    func fetchData<T>(request: T) { }
    
    // MARK: - Get Selected News
    func getSelectedNews() -> NewsArticle? {
        return self.selectedNews
    }
    
    // MARK: - Get Fav News
    func getFavNewsStatus(news: NewsArticle) {
        let isFav: Bool = CoreDataManager().getSelectedNewsStatus(news)
        presenter?.setData(data: isFav)
    }
    
    // MARK: - Set Fav News
    func setFavNews(news: NewsArticle, isFav: Bool) {
        CoreDataManager().setFavouriteNews(with: news, isFav: isFav)
        presenter?.setData(data: isFav)
    }
}
