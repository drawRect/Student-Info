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
        setRootScene()
        return true
    }
    
}

extension AppDelegate {
    private func setRootScene() {
        let studTabBarItem = UITabBarItem(title: "Students", image: #imageLiteral(resourceName: "icStudent"), selectedImage: #imageLiteral(resourceName: "icStudent"))
        let studNC = UINavigationController(studTabBarItem, child: StudentsListController())

        let profTabBarItem = UITabBarItem(title: "Professors", image: #imageLiteral(resourceName: "icProfessor"), selectedImage: #imageLiteral(resourceName: "icProfessor"))
        let profNC = UINavigationController(profTabBarItem, child: ProfessorListController())

        let tc = UITabBarController()
        tc.viewControllers = [profNC,studNC]

        window?.rootViewController = tc
    }
}
