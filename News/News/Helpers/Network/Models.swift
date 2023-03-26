//
//  Models.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation
import Alamofire

struct BaseResponse<T: Codable> {
    var model: T?
    var message: String?
}

struct BaseError {
    var errorMessage: String?
    var statusCode: Int?
    var debugMessage: String?

    init(_ afError: AFError?) {
        debugMessage = afError.debugDescription
        statusCode = afError?.responseCode
        errorMessage = afError?.errorDescription
    }
}
