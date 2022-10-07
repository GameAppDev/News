//
//  WebInteractor.swift
//  News
//
//  Created by Oguzhan Yalcin on 14.09.2022.
//

import Foundation

final class WebInteractor: Interactorable {
    
    public weak var presenter: WebPresenter?
    
    public var apiState: ApiState = .beforeRequest
}
