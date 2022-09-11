//
//  ListInteractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation

final class ListInteractor: Interactorable {
    
    public var presenter: ListPresenter?
    
    public var apiState: ApiState = .beforeRequest
}

extension ListInteractor: PListPresenterToInteractor {
    
    func fetchNewsData(params: NewsPost) {
        let endPoint: String =  "everything"
        let requestParams: [String: String] = ["q": params.searchedKey, "page": String(params.page), "apiKey": ApplicationConstant.apiKey]
        NetworkManager().get(path: endPoint, requestParams, onSuccess: { (response: BaseResponse<NewsResponse>) in
            guard let data = response.model, let newsArticles = response.model?.articles else { return }
            debugPrint("<--- Service gets response: \(data) - count: \(newsArticles.count) - path: \(endPoint) --->")
            self.presenter?.onSuccessNews(response: newsArticles)
        }) { (error) in
            debugPrint("<---! Service gets error: \(error) - path: \(endPoint) !--->")
            self.presenter?.onErrorNews(error: error)
        }
    }
}
