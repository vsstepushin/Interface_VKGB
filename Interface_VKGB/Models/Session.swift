//
//  Session.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 20.03.2021.
//

import Foundation

class Session {
    var token: String = ""
    var userId: String = ""
    
    private init() { }
    
    static let sharedSession = Session()
    
    
    func toDictionary() -> [String: Any] {
        return [
            "accessToken": token,
            "userId": userId
        ]
    }
}
