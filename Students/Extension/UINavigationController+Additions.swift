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
}
