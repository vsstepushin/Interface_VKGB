//
//  AppDelegate.swift
//  Interface_VKGB
//
//  Created by Виталий Степушин on 14.01.2021.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    var window: UIWindow?

         func application(_ application: UIApplication,
                          didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
             FirebaseApp.configure()
             Auth.auth().signInAnonymously() { (authResult, error) in
                if authResult != nil {
                     guard let user = authResult?.user else { return }
                     let isAnonymous = user.isAnonymous
                     let uid = user.uid
                     print(uid)
                 } else if let error = error {
                     print(error)
                 }
             }
        return true
    }

    func application(_ application: UIApplication,
                          configurationForConnecting connectingSceneSession: UISceneSession,
                          options: UIScene.ConnectionOptions) -> UISceneConfiguration {
             return UISceneConfiguration(name: "Default Configuration",
                                         sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
      
    }


}

