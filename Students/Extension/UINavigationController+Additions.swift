//
//  UINavigationController+Additions.swift
//  Students
//
//  Created by Ranjith Kumar on 6/10/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

extension UINavigationController {
    convenience init(_ tabBarType: TabBarType, child: UIViewController) {
        self.init()
        self.tabBarItem = tabBarType.tabBarItem
        self.viewControllers = [child]
    }

    func setupAppThemeBar() {
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = true
            navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        } else {
            // Fallback on earlier versions
        }
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationBar.tintColor = UIColor.white
    }
}
