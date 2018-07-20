//
//  AppDelegate.swift
//  Project
//
//  Created by Nugumanov on 10.07.18.
//  Copyright © 2018 Nugumanov Dima. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        window.makeKeyAndVisible()
        
        return true
    }
    
}
