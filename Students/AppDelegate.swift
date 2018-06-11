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
        let studNC = UINavigationController(.students, child: StudentsListController())
        let profNC = UINavigationController(.professors, child: ProfessorListController())

        let tc = UITabBarController()
        tc.viewControllers = [profNC,studNC]

        window?.rootViewController = tc
    }
}

enum TabBarType: String {
    case professors = "Professors"
    case students = "Students"
    
    var tabBarItem: UITabBarItem {
        switch self {
        case .professors:
            return UITabBarItem(title: TabBarType.professors.rawValue, image: #imageLiteral(resourceName: "icProfessor"), selectedImage: #imageLiteral(resourceName: "icProfessor"))
        case .students:
            return UITabBarItem(title: TabBarType.students.rawValue, image: #imageLiteral(resourceName: "icStudent"), selectedImage: #imageLiteral(resourceName: "icStudent"))
        }
    }
}

