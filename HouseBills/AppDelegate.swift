//
//  AppDelegate.swift
//  HouseBills
//
//  Created by Tiago Bencardino on 17/05/2018.
//  Copyright © 2018 Tiago Bencardino. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    /// This method is called as a callback from another application, such as Safari
    func application(_ app: UIApplication,
                     open url: URL,
                     options: [UIApplicationOpenURLOptionsKey: Any] = [:]) -> Bool {
        EmbedSafariManager.shared.dismiss()
        switch url.lastPathComponent {
        case "housebills_starling":
            APIManager.shared.fetchStarlingToken(from: url)
        default:
            return true
        }

        return true
    }


}

