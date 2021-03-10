//
//  Groups.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 28.01.2021.
//

import UIKit

struct Groups {
    var groupName: String
    var groupAvatar: UIImage?
    
    init(groupName: String, groupAvatar: String) {
        self.groupName = groupName
        self.groupAvatar = UIImage(named: groupAvatar)
    }
    
}

extension Groups: Equatable {
    static func == (lhs: Groups, rhs: Groups) -> Bool {
        lhs.groupName == rhs.groupName && lhs.groupAvatar == rhs.groupAvatar
    }
}
var allGroups: [Groups] = [
    Groups(groupName: "Skype", groupAvatar: "SkypeAva"),
    Groups(groupName: "Discord", groupAvatar: "DiscordAva"),
    Groups(groupName: "GB", groupAvatar: "GBAva"),
    Groups(groupName: "Instagramm", groupAvatar: "InstaAva"),
    Groups(groupName: "Telegramm", groupAvatar: "telegAvatar"),
    Groups(groupName: "Viber", groupAvatar: "ViberAva"),
    Groups(groupName: "Zoom", groupAvatar: "ZoomAva")]

var myGroup: [Groups] = [
    Groups(groupName: "Discord", groupAvatar: "DiscordAva"),
    Groups(groupName: "GB", groupAvatar: "GBAva")]
