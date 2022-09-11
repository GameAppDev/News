//
//  ListInteractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation

final class ListInteractor: Interactorable {
    
    private var networkManager: Networkable?
    public var presenter: ListPresenter?
    
    public var apiState: ApiState = .beforeRequest
}

extension ListInteractor: PListPresenterToInteractor {
    
    func fetchNewsData(request: NewsPost) {
        let endPoint: String = "?q=\(request.searchedKey)&page=\(request.page)&apiKey=\(ApplicationConstant.apiKey)"
        networkManager?.get(path: endPoint, nil, onSuccess: { (response: BaseResponse<NewsResponse>) in
            guard let data = response.model, let newsArticles = response.model?.articles else { return }
            debugPrint("<--- Service gets response: \(data) - path: \(endPoint) --->")
            self.presenter?.onSuccessNews(response: newsArticles)
        }) { (error) in
            debugPrint("<---! Service gets error: \(error) - path: \(endPoint) !--->")
            self.presenter?.onErrorNews(error: error)
        }
    }
}
