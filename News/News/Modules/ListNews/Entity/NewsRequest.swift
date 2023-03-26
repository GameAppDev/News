//
//  NewsRequest.swift
//  News
//
//  Created by Oguzhan Yalcin on 19.02.2023.
//

import Foundation

struct NewsRequest: Codable {
    let searchedKey: String
    let page: Int
    
    init(searchedKey: String?, page: Int?) {
        self.searchedKey = searchedKey ?? ""
        self.page = page ?? 0
    }
}
