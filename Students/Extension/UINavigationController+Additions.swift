//
//  UINavigationController+Additions.swift
//  Students
//
//  Created by Ranjith Kumar on 6/10/18.
//  Copyright © 2018 Dash. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    convenience init(_ tabBarItem: UITabBarItem, child: UIViewController) {
        self.init()
        self.tabBarItem = tabBarItem
        self.viewControllers = [child]
    }
}
