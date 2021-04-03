//
//  VKGroup.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 03.04.2021.
//

import Foundation

struct VKGroupRequestResponse: Codable {
     let response: VKGroupResponse
 }

 struct VKGroupResponse: Codable {
     let items: [VKGroup]
 }

 struct VKGroup: Codable {
     var groupId: Int
     var groupName: String
     var avatarUrl: String
 }

 extension VKGroup: CustomStringConvertible {
     var description: String {
         return String(format: "%@ (%ld)", groupName, groupId)
     }
 }

 extension VKGroup {
     enum CodingKeys: String, CodingKey {
         case groupId = "id"
         case groupName = "name"
         case avatarUrl = "photo_200"
     }
 }
