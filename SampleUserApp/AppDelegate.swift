//
//  AppDelegate.swift
//  SampleUserApp
//
//  Created by Sonata on 19/06/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = {
       let w = UIWindow()
        w.makeKeyAndVisible()
        return w
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        setUpRootScene()
        return true
    }

}

extension AppDelegate {
    func setUpRootScene() {
        let navController = UINavigationController()
        navController.viewControllers = [LoginViewController()]
        window?.rootViewController = navController
    }
}
