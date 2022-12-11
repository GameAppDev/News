//
//  WebInteractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 14.09.2022.
//

import Foundation

final class WebInteractor {
    
    public weak var presenter: WebPresenter?
    
    public var url: URL?
    public var apiState: ApiState = .beforeRequest
}

extension WebInteractor: PWebPresenterToInteractor {
    
    // MARK: - Fetch
    func fetchData<T>(request: T) { }
    
    // MARK: - Get News Url
    func getNewsUrl() -> URL? {
        return self.url
    }
}
