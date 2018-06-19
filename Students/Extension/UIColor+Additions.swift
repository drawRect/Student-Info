//
//  UIColor+Additions.swift
//  Students
//
//  Created by Ranjith Kumar on 6/11/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    convenience init(hex: Int, alpha: CGFloat=1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 0xFF
        let green = CGFloat((hex & 0x00FF00) >> 8) / 0xFF
        let blue = CGFloat(hex & 0x0000FF) / 0xFF
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}

