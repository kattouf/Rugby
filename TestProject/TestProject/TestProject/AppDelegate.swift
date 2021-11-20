//
//  AppDelegate.swift
//  TestProject
//
//  Created by Vyacheslav Khorkov on 21.03.2021.
//  Copyright © 2021 Vyacheslav Khorkov. All rights reserved.
//

import UIKit
import SnapKit
import KeyboardLayoutGuide
import Alamofire

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Just for testing
        AF.request("https://httpbin.org/get").response { response in
            debugPrint(response)
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
}
