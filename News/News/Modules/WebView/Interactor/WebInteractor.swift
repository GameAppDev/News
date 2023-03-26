//
//  WebInteractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 14.09.2022.
//

import Foundation

final class WebInteractor {
    
    weak var presenter: PWebInteractorToPresenter?
    var url: URL?
}

extension WebInteractor: PWebPresenterToInteractor {
    
    // MARK: - Fetch
    func fetchData<T>(request: T) { }
    
    // MARK: - Get News Url
    func getNewsUrl() -> URL? {
        return url
    }
}
