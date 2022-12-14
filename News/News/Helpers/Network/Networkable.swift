//
//  Networkable.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation

protocol Networkable {
    
    func get<T: Codable>(path: String, _ paramaters: [String: String]?, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void)
    
    func put<T: Codable>(path: String, _ paramaters: [String: String]?, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void)
    
    func post<T: Codable>(path: String, _ paramaters: [String: String]?, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void)
}
