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

    private let window: UIWindow = {
        let w =  UIWindow(frame: Constants.Screen.bounds)
        w.makeKeyAndVisible()
        return w
    }()

}

extension AppDelegate: UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
//        setRootScene()
        setSplashScreen()
        return true
    }
}

extension AppDelegate {

    private func setSplashScreen() {
        let nc = UINavigationController()
        nc.viewControllers = [SplashViewController()]
        window.rootViewController = nc
    }
    private func setRootScene() {
        let studNC = UINavigationController(.students,
                                            child: StudentsListController())
        let profNC = UINavigationController(.professors,
                                            child: ProfessorListController())
        let signupNC = UINavigationController(rootViewController: SignupViewController())

        let tc = UITabBarController()
        tc.viewControllers = [signupNC,profNC,studNC]

        window.rootViewController = tc
    }
}

enum TabBarType: String {
    case professors = "Professors"
    case students = "Students"
    
    var tabBarItem: UITabBarItem {
        switch self {
        case .professors:
            return UITabBarItem(title: TabBarType.professors.rawValue,
                                image: #imageLiteral(resourceName: "icProfessor"),
                                selectedImage: #imageLiteral(resourceName: "icProfessor"))
        case .students:
            return UITabBarItem(title: TabBarType.students.rawValue,
                                image: #imageLiteral(resourceName: "icStudent"),
                                selectedImage: #imageLiteral(resourceName: "icStudent"))
        }
    }
}

