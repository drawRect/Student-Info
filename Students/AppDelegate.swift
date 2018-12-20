//
//  AppDelegate.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 DrawRect. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder {

     let window: UIWindow = {
        let w =  UIWindow(frame: Constants.Screen.bounds)
        w.makeKeyAndVisible()
        return w
    }()

}

extension AppDelegate: UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        setupSplashScreen()
        return true
    }
}

extension AppDelegate {

    private func setupSplashScreen() {
        let nc = UINavigationController()
        nc.viewControllers = [SplashViewController()]
        nc.setupAppThemeBar()
        window.rootViewController = nc
    }
}



