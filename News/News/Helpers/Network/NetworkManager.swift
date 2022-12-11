//
//  NetworkManager.swift
//  News
//
//  Created by Oguzhan Yalcin on 11.09.2022.
//

import Foundation
import Alamofire

typealias Success<T: Codable> = (BaseResponse<T>) -> Void
typealias Error = (BaseError) -> Void

final class NetworkManager: Networkable {
    
    func get<T>(path: String, _ paramaters: [String: String]?, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void) where T: Decodable, T: Encodable {
        AF.request(networkRequestUrlWith(path), method: .get, parameters: paramaters).validate().responseDecodable(of: T.self) { response in
            guard let model = response.value else {
                onError(BaseError(response.error))
                return
            }
            onSuccess(BaseResponse.init(model: model, message: "SUCCESS"))
        }
    }
    
    func put<T>(path: String, _ paramaters: [String: String]?, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void) where T: Decodable, T: Encodable {
        AF.request(networkRequestUrlWith(path), method: .put, parameters: paramaters).validate().responseDecodable(of: T.self) { response in
            guard let model = response.value else {
                onError(BaseError(response.error))
                return
            }
            onSuccess(BaseResponse.init(model: model, message: "SUCCESS"))
        }
    }
    
    func post<T>(path: String, _ paramaters: [String: String]?, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void) where T: Decodable, T: Encodable {
        AF.request(networkRequestUrlWith(path), method: .post, parameters: paramaters).validate().responseDecodable(of: T.self) { response in
            guard let model = response.value else {
                onError(BaseError(response.error))
                return
            }
            onSuccess(BaseResponse.init(model: model, message: "SUCCESS"))
        }
    }
}

extension NetworkManager {
    
    private func networkRequestUrlWith(_ path: String) -> String {
        return ApplicationConstant.baseUrl + path
    }
}
