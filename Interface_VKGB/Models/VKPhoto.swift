//
//  VKPhoto.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 03.04.2021.
//

import Foundation


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

 struct VKPhoto: Codable {
     var photoId: Int
     var url: String
 }

 extension VKPhoto: CustomStringConvertible {
     var description: String {
         return String(format: "%ld (%@)", photoId, url)
     }
 }

 extension VKPhoto {
     enum CodingKeys: String, CodingKey {
         case photoId = "id"
         case url = "photo_604"
     }
 }
