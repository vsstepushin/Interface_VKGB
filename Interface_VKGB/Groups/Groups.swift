//
//  Groups.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 28.01.2021.
//

import UIKit

struct groups {
    var groupName: String
    var groupAvatar: UIImage?
    
    init(groupName: String, groupAvatar: String) {
        self.groupName = groupName
        self.groupAvatar = UIImage(named: groupAvatar)
    }
    
}

extension groups: Equatable {
    static func == (lhs: groups, rhs: groups) -> Bool {
        lhs.groupName == rhs.groupName && lhs.groupAvatar == rhs.groupAvatar
    }
}
var allGroups: [groups] = [
    groups(groupName: "Skype", groupAvatar: "SkypeAva"),
    groups(groupName: "Discord", groupAvatar: "DiscordAva"),
    groups(groupName: "GB", groupAvatar: "GBAva"),
    groups(groupName: "Instagramm", groupAvatar: "InstaAva"),
    groups(groupName: "Telegramm", groupAvatar: "telegAvatar"),
    groups(groupName: "Viber", groupAvatar: "ViberAva"),
    groups(groupName: "Zoom", groupAvatar: "ZoomAva")]

var myGroup: [groups] = [
    groups(groupName: "Discord", groupAvatar: "DiscordAva"),
    groups(groupName: "GB", groupAvatar: "GBAva")]
