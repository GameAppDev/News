//
//  ListPresenter.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation

final class ListPresenter {
    
    private var view: ListViewController?
    private var interactor: ListInteractor?
    private var router: ListRouter?
    
    init(view: ListViewController, interactor: ListInteractor, router: ListRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension ListPresenter: PListViewToPresenter {
    
    func getNews(request: NewsPost) {
        
    }
    
    func navigateToDetail() {
        
    }
    
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        
    }
}

extension ListPresenter: PListInteractorToPresenter {
    
    func onSuccessNews(response: [NewsArticle]) {
        
    }
    
    func onErrorNews(error: BaseError) {
        
    }
}
