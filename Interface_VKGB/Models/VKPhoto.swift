//
//  VKPhoto.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 03.04.2021.
//

import Foundation
import RealmSwift

// struct VKPhotoRequestResponse: Decodable {
//     let response: VKPhotoResponse
//
//
//      struct VKPhotoResponse: Decodable {
//         let items: [VKPhoto]
//     }
//
//      class VKPhoto: Decodable {
//         dynamic var image = ""
//
//         enum ItemsKeys: String, CodingKey {
//             case image = "photo_604"
//         }
//
//         convenience required init(from decoder: Decoder) throws {
//             self.init()
//             let values = try decoder.container(keyedBy: ItemsKeys.self)
//             self.image = try values.decode(String.self, forKey: .image)
//         }
//     }
// }

struct VKPhotoRequestResponse: Codable {
     let response: VKPhotoResponse
 }

 struct VKPhotoResponse: Codable {
     let items: [VKPhoto]
 }

class VKPhoto: Object, Codable {
     override var description: String {
         return String(format: "%ld (%@)", photoId, url)
     }

    @objc dynamic var photoId: Int
    @objc dynamic var url: String
}

 extension VKPhoto {
     enum CodingKeys: String, CodingKey {
         case photoId = "id"
         case url = "photo_604"
     }
 }
