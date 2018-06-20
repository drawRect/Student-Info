//
//  UILabel+Additions.swift
//  Students
//
//  Created by Ranjith Kumar on 6/10/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    //Mark: - case: TableViewFooterView
    convenience init(footerString: String) {
        self.init()
        text = footerString
        textColor = .lightGray
        sizeToFit()
        textAlignment = .center
    }
}
