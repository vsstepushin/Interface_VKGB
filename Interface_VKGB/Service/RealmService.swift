//
//  RealmService.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 12.04.2021.
//

import Foundation
import RealmSwift

 class RealmService {
     static let instance = RealmService()

     private init() {}

     func saveObjects<T: Object>(_ objects: [T]) {
         do {
             let realm = try Realm()
             realm.beginWrite()
             realm.add(objects)
             try realm.commitWrite()
         } catch {
             print(error)
         }
     }
 }
