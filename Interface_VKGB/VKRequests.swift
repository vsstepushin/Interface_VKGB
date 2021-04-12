//
//  VKRequests.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 27.03.2021.
//

import Foundation
import Alamofire

class VKRequests {
    
    static func vkLoginRequests() -> URLRequest {
        var urlComponents = URLComponents()
            urlComponents.scheme = "https"
            urlComponents.host = "oauth.vk.com"
            urlComponents.path = "/authorize"
            urlComponents.queryItems = [
                    URLQueryItem(name: "client_id", value: "7804841"),
                    URLQueryItem(name: "display", value: "mobile"),
                    URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
                    URLQueryItem(name: "scope", value: "262150"),
                    URLQueryItem(name: "response_type", value: "token"),
                    URLQueryItem(name: "v", value: "5.103")
                ]
                
                let request = URLRequest(url: urlComponents.url!)
                
                return request
    }
    
}





