//
//  AppDelegate.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var window: UIWindow? = {
        let w =  UIWindow()
        w.makeKeyAndVisible()
        return w }()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let nc = UINavigationController()
        nc.viewControllers = [StudentsListController()]
        window?.rootViewController = nc
        return true
    }
    
}
