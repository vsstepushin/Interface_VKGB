//
//  FirebaseService.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 25.04.2021.
//

import Foundation
import Firebase
import FirebaseDatabase

 class FirebaseService {
     static let instance = FirebaseService()

     private let databaseReference: DatabaseReference! = Database.database().reference()
     private var userId: String = {
         return Auth.auth().currentUser?.uid ?? ""
     }()

     private init() {}

     func setValue(_ parent: String,
                   _ value: [String: Any]) {
        databaseReference.child(parent).child(userId).setValue(value)
     }
 }
