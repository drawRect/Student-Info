//
//  StudentInfoCell.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation
import UIKit

class StudentInfoCell: UITableViewCell {}

//MARK: - Extension|StudentInfoCell
extension StudentInfoCell {
    func configureCell(model: Student) {
        self.textLabel?.text = (model.name + ", " + model.age)
        self.textLabel?.textColor = Constants.titleColor
        self.detailTextLabel?.text = model.address
        self.detailTextLabel?.textColor = Constants.titleColor
    }
}
