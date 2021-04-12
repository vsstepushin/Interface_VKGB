//
//  VKService.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 03.04.2021.
//

import Foundation
import Alamofire

class VKService {
    static let instance = VKService()
    
    private let baseUrl = "https://api.vk.com/method/"
    private let apiVersion = "5.103"
    private let accessToken = Session.sharedSession.token
    
    private init() {}
    
    func loadFriends(handler: @escaping (Result<[VKUser], Error>) -> Void) {
        let apiMethod = "friends.get"
        let apiEndpoint = baseUrl + apiMethod
        let requestParameters = [
            "access_token": accessToken,
            "v": apiVersion,
            "fields": "photo_200_orig, online"
        ]
        AF.request(apiEndpoint,
                   method: .get,
                   parameters: requestParameters)
            .validate()
            .responseData(completionHandler: { responseData in
                guard let data = responseData.data else {
                    handler(.failure(VKAPIError.error("Data error")))
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let requestResponse = try decoder.decode(VKUserRequestResponse.self,
                                                             from: data)
                    handler(.success(requestResponse.response.items))
                } catch {
                    handler(.failure(error))
                }
            })
    }
    
    func loadPhotos(userId: Int,
                    handler: @escaping (Result<[VKPhoto], Error>) -> Void) {
        let apiMethod = "photos.getAll"
        let apiEndpoint = baseUrl + apiMethod
        var requestParameters = [
            "access_token": accessToken,
            "v": apiVersion,
            "owner_id": String(userId),
            "extended": "0",
            "photo_sizes": "0",
            "count": "30"
        ]
        requestParameters["v"] = "5.00"
        
        AF.request(apiEndpoint,
                   method: .get,
                   parameters: requestParameters)
            .validate()
            .responseData(completionHandler: { responseData in
                guard let data = responseData.data else {
                    handler(.failure(VKAPIError.error("Data error")))
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let requestResponse = try
                        decoder.decode(VKPhotoRequestResponse.self, from: data)
                    handler(.success(requestResponse.response.items))
                } catch {
                    handler(.failure(error))
                }
            })
    }
    
    func loadGroups(handler: @escaping (Result<[VKGroup], Error>) -> Void) {
        let apiMethod = "groups.get"
        let apiEndpoint = baseUrl + apiMethod
        let requestParameters = [
            "access_token": accessToken,
            "v": apiVersion,
            "extended": "1"
        ]
        
        AF.request(apiEndpoint,
                   method: .get,
                   parameters: requestParameters)
            .validate()
            .responseData(completionHandler: { responseData in
                guard let data = responseData.data else {
                    handler(.failure(VKAPIError.error("Data error")))
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let requestResonse = try
                        decoder.decode(VKGroupRequestResponse.self, from: data)
                    handler(.success(requestResonse.response.items))
                } catch {
                    handler(.failure(error))
                }
            })
    }
    
    func searchGroups(searchQuery: String,
                      handler: @escaping (Result<[String: Any]?, Error>) -> Void) {
        let apiMethod = "groups.search"
        let apiEndpoint = baseUrl + apiMethod
        let requestParameters = [
            "access_token": accessToken,
            "v": apiVersion,
            "q": searchQuery
        ]

        AF.request(apiEndpoint,
                   method: .get,
                   parameters: requestParameters)
            .validate()
            .responseJSON { response in
            switch response.result {
            case .success(let result):
                if let result = result as? [String: Any] {
                    handler(.success(result))
                } else {
                    handler(.failure(VKAPIError.error("Data error")))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
}
