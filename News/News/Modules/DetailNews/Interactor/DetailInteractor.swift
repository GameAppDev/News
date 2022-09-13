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
