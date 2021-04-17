//
//  Groups.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 28.01.2021.
//

import Foundation

enum GroupType {
    case opened
    case closed
}

enum GroupTheme {
    case unknown
    case education
    case hobby
    case travel
    case sport
    case news
}

class Group {
    var name: String
    var type: GroupType
    var theme: GroupTheme
    var avatarImageName: String
    var numberOfFollowers: Int
    
    init(name: String,
         type: GroupType = .opened,
         theme: GroupTheme = .unknown,
         avatarImageName: String,
         numberOfFollowers: Int = 0) {
        self.name = name
        self.type = type
        self.theme = theme
        self.avatarImageName = avatarImageName
        self.numberOfFollowers = numberOfFollowers

    }
}

extension Group: Equatable {
    static func == (lhs: Group, rhs: Group) -> Bool {
        return lhs.name == rhs.name
    }
}


//import UIKit

//struct Groups {
//    var groupName: String
//    var groupAvatar: UIImage?
//
//    init(groupName: String, groupAvatar: String) {
//        self.groupName = groupName
//        self.groupAvatar = UIImage(named: groupAvatar)
//    }
//
//}
//
//extension Groups: Equatable {
//    static func == (lhs: Groups, rhs: Groups) -> Bool {
//        lhs.groupName == rhs.groupName && lhs.groupAvatar == rhs.groupAvatar
//    }
//}
//var allGroups: [Groups] = [
//    Groups(groupName: "Skype", groupAvatar: "SkypeAva"),
//    Groups(groupName: "Discord", groupAvatar: "DiscordAva"),
//    Groups(groupName: "GB", groupAvatar: "GBAva"),
//    Groups(groupName: "Instagramm", groupAvatar: "InstaAva"),
//    Groups(groupName: "Telegramm", groupAvatar: "telegAvatar"),
//    Groups(groupName: "Viber", groupAvatar: "ViberAva"),
//    Groups(groupName: "Zoom", groupAvatar: "ZoomAva")]
//
//var myGroup: [Groups] = [
//    Groups(groupName: "Discord", groupAvatar: "DiscordAva"),
//    Groups(groupName: "GB", groupAvatar: "GBAva")]
