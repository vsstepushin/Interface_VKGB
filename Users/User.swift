//
//  User.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 21.01.2021.
//

import UIKit

class usersId {
    
    var userId: String
    
    init(userId: String) {
        self.userId = userId
        
    }
}

class userIdentification: usersId {
    var userPhone: String
    var userEmail: String
    var userPassword: String
    
    init(userId: String, userPhone: String, userEmail: String, userPassword: String) {
        self.userPhone = userPhone
        self.userEmail = userEmail
        self.userPassword = userPassword
        super.init (userId: userId)
    }
    
}

class userProfile: usersId{
    
    var userName: String
    var userSurname: String
    var userAge: Int
    
    init(userId: String, userName: String, userSurname: String, userAge: Int) {
        self.userName = userName
        self.userSurname = userSurname
        self.userAge = userAge
        super.init (userId: userId)
    }
}
