//
//  User.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 21.01.2021.
//

import Foundation

enum MaritalStatus {
    case married
    case divorced
    case single
    case activelyLooking
}

enum LifeStatus {
    case working
    case housewife
    case schoolboy
    case schoolgirl
    case baby
    case pensioner
}

class User {
    var name: String
    var age: Int
    var numberOfFollowers: Int
    var maritalStatus: MaritalStatus
    var lifeStatus: LifeStatus
    var avatarImageName: String
    var photosImageName: [String]
    
    init(name: String,
         age: Int,
         numberOfFollowers: Int,
         maritalStatus: MaritalStatus,
         lifeStatus: LifeStatus,
         avatarImageName: String,
         photosImageName: [String] = [String]()) {
        self.name = name
        self.age = age
        self.numberOfFollowers = numberOfFollowers
        self.maritalStatus = maritalStatus
        self.lifeStatus = lifeStatus
        self.avatarImageName = avatarImageName
        self.photosImageName = photosImageName
    }
}


//class UsersId {
//    
//    var userId: String
//    
//    init(userId: String) {
//        self.userId = userId
//        
//    }
//}
//
//class UserIdentification: UsersId {
//    var userPhone: String
//    var userEmail: String
//    var userPassword: String
//    
//    init(userId: String, userPhone: String, userEmail: String, userPassword: String) {
//        self.userPhone = userPhone
//        self.userEmail = userEmail
//        self.userPassword = userPassword
//        super.init (userId: userId)
//    }
//}
//
//class UserProfile: UsersId{
//    
//    var userName: String
//    var userSurname: String
//    var userAvatar: UIImage?
//    var userPhotos: [UIImage?]
//    
//    
//    init(userId: String, userName: String, userSurname: String, userAvatar: UIImage?, userPhotos: [UIImage?]) {
//        self.userName = userName
//        self.userSurname = userSurname
//        self.userAvatar = userAvatar
//        self.userPhotos = userPhotos
//        super.init (userId: userId)
//    }
//}
//
//let vpProf = UserProfile(userId: "1", userName: "Валентин", userSurname: "Петухов", userAvatar: UIImage(named: "VP.1.Avatar"),
//                         userPhotos: [UIImage(named: "VP.1.1"),
//                                      UIImage(named: "VP.1.2"),
//                                      UIImage(named: "VP.1.3"),
//                                      UIImage(named: "VP.1.4"),
//                                      UIImage(named: "VP.1.5")])
//let dgProf = UserProfile(userId: "2", userName: "Дмитрий", userSurname: "Гордей", userAvatar: UIImage(named: "DG.2.Avatar"),
//                         userPhotos: [UIImage(named: "DG.2.1"),
//                                      UIImage(named: "DG.2.2"),
//                                      UIImage(named: "DG.2.3"),
//                                      UIImage(named: "DG.2.4"),
//                                      UIImage(named: "DG.2.5"),
//                                      UIImage(named: "DG.2.6")])
//let dkProf = UserProfile(userId: "3", userName: "Даня", userSurname: "Крайстер", userAvatar: UIImage(named: "DK.3.Avatar"),
//                         userPhotos: [UIImage(named: "DK.3.1"),
//                                      UIImage(named: "DK.3.2"),
//                                      UIImage(named: "DK.3.3"),
//                                      UIImage(named: "DK.3.4")])
//let ltProf = UserProfile(userId: "4", userName: "Лихой", userSurname: "Топор", userAvatar: UIImage(named: "LT.4.Avatar"),
//                         userPhotos: [UIImage(named: "LT.4.1"),
//                                      UIImage(named: "LT.4.2")])
//let dmProf = UserProfile(userId: "5", userName: "Дмитрий", userSurname: "Масленников", userAvatar: UIImage(named: "DM.5.Avatar"),
//                         userPhotos: [UIImage(named: "DM.5.1"),
//                                      UIImage(named: "DM.5.2"),
//                                      UIImage(named: "DM.5.3"),
//                                      UIImage(named: "DM.5.4"),
//                                      UIImage(named: "DM.5.5"),
//                                      UIImage(named: "DM.5.6"),
//                                      UIImage(named: "DM.5.7"),
//                                      UIImage(named: "DM.5.8"),
//                                      UIImage(named: "DM.5.9")])
//let amProf = UserProfile(userId: "6", userName: "Алик", userSurname: "Макиев", userAvatar: UIImage(named: "AM.6.Avatar"),
//                         userPhotos: [UIImage(named: "AM.6.1"),
//                                      UIImage(named: "AM.6.2"),
//                                      UIImage(named: "AM.6.3"),
//                                      UIImage(named: "AM.6.4"),
//                                      UIImage(named: "AM.6.5")])
//
//var allFriend = [vpProf, dgProf, dkProf, ltProf, dmProf, amProf]
