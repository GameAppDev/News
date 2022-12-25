//
//  ListEntity.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation

struct NewsRequest: Codable {
    let searchedKey: String
    let page: Int
}

struct NewsResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [NewsArticle]?
    let message: String?
}

struct NewsArticle: Codable {
    let source: NewsSource?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct NewsSource: Codable {
    //let id: String?
    let name: String?
}
