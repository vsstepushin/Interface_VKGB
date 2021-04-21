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
    
    func fetchObjects<T: Object>(_ type: T.Type) -> [T]? {
             do {
                 let realm = try Realm()
                 return realm.objects(type).map{$0}
             } catch {
                 print(error)
             }
             return nil
         }

         func deleteObjects<T: Object>(_ type: T.Type) {
             do {
                 let realm = try Realm()
                 if let objects = fetchObjects(type) {
                     realm.beginWrite()
                     realm.delete(objects)
                     try realm.commitWrite()
                 }
             } catch {
                 print(error)
             }
         }
 }
