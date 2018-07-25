//
//  UIView+Extension.swift
//  Students
//
//  Created by Sonata on 26/06/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public var layoutGuide: UILayoutGuide {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide
        }
        return self.layoutMarginsGuide
    }
}
