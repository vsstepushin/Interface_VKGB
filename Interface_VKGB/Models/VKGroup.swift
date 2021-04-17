//
//  VKGroup.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 03.04.2021.
//

import Foundation
import RealmSwift

struct VKGroupRequestResponse: Codable {
     let response: VKGroupResponse
 }

struct VKGroupResponse: Codable {
     let items: [VKGroup]
 }

class VKGroup: Object, Codable {
     override var description: String {
         return String(format: "%@ (%ld)", groupName, groupId)
     }

    @objc dynamic var groupId: Int
    @objc dynamic var groupName: String
    @objc dynamic var avatarUrl: String
}

 extension VKGroup {
     enum CodingKeys: String, CodingKey {
         case groupId = "id"
         case groupName = "name"
         case avatarUrl = "photo_200"
     }
 }
