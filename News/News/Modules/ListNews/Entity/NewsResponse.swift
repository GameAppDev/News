//
//  NewsResponse.swift
//  News
//
//  Created by Oguzhan Yalcin on 19.02.2023.
//

import Foundation

struct NewsResponse: Codable {
    let status: String?
    let totalResults: Int?
    let news: [NewsArticle]?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case news = "articles"
        case message
    }
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
