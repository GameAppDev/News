//
//  ListInteractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation

final class ListInteractor {
    
    weak var presenter: PListInteractorToPresenter?
    private var news: [NewsArticle] = []
}

extension ListInteractor: PListPresenterToInteractor {
    
    // MARK: - Fetch News
    func fetchData<T>(request: T) {
        guard let request = request as? NewsRequest else { return }
        
        let endPoint: String =  "everything"
        let requestParams: [String: String] = [
            "q": request.searchedKey,
            "page": String(request.page),
            "apiKey": ApplicationConstant.apiKey
        ]
        NetworkManager().get(path: endPoint, requestParams, onSuccess: { [weak self] (response: BaseResponse<NewsResponse>) in
            guard let self = self else { return }
            
            guard let data = response.model,
                  let newsArticles = response.model?.news else { return }
            
            debugPrint("<--- Service gets response: \(data) - count: \(newsArticles.count) - path: \(endPoint) --->")
            self.news.append(contentsOf: newsArticles)
            
            self.presenter?.setData(data: self.news)
        }) { [weak self] (error) in
            guard let self = self else { return }
            
            debugPrint("<---! Service gets error: \(error) - path: \(endPoint) !--->")
            self.presenter?.setError(error: error)
        }
    }
    
    // MARK: - Get News
    func getNews() -> [NewsArticle] {
        return news
    }
    
    // MARK: - Remove News
    func removeNews() {
        news.removeAll()
    }
}
