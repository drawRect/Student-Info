//
//  TabBarType.swift
//  Students
//
//  Created by Ranjith Kumar on 12/20/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

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
