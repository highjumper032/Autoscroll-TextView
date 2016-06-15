//
//  AppDelegate.swift
//  Jtabs
//
//  Created by High Jumper on 10/11/16.
//  Copyright © 2016 High Jumper. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.isIdleTimerDisabled = true
        return true
    }
}

