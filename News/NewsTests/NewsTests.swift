//
//  NewsTests.swift
//  NewsTests
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import XCTest
@testable import News

class NewsTests: XCTestCase {
    
    // MARK: Service Call
    func testCallNewsListService() {
        let endPoint: String =  "everything"
        let requestParams: [String: String] = ["q": "iPhone",
                                               "page": "1",
                                               "apiKey": ApplicationConstant.apiKey]
        NetworkManager().get(path: endPoint, requestParams, onSuccess: { (response: BaseResponse<NewsResponse>) in
            
            XCTAssertEqual(response.message, "SUCCESS")
            XCTAssertNotNil(response.model)
        }) { (error) in
            
            XCTAssertNil(error)
        }
    }
    
    // MARK: Core Data
    func testGetCoreDataFavNews() {
        let favouriteNews = CoreDataManager.shared.getFavouriteNews()
        
        XCTAssertNotNil(favouriteNews)
    }
    
    // MARK: Constants
    func testCheckBaseUrl() {
        let isBaseUrlValid = ApplicationConstant.baseUrl.contains("newsapi.org")
        
        XCTAssertTrue(isBaseUrlValid)
    }
    
    // MARK: extension Array
    func testCheckEmptyArrayIndex() {
        let empty: [String] = []
        let nilValue = empty[safe: 4]
        
        XCTAssertNil(nilValue)
    }
    
    func testRemoveObjectGeneric() {
        var players: [String] = ["Ronaldo", "Messi", "Neymar", "Haaland"]
        players.removeObject("Neymar")
        
        XCTAssertEqual(players.count, 3)
        
        var years: [Int] = [2023, 2024, 2025]
        years.removeObject(2022)
        
        XCTAssertEqual(years.count, 3)
        
        years.removeObject(2023)
        
        XCTAssertEqual(years.count, 2)
    }
    
    // MARK: extension String
    func testCheckStringToDouble() {
        let clubToDouble: Double? = "Manchester United".toDouble()
        let valueToDouble: Double? = "728.10".toDouble()
        
        XCTAssertNil(clubToDouble)
        XCTAssertNotNil(valueToDouble)
    }
}
