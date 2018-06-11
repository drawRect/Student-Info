//
//  StudentInfoCell.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation
import UIKit

class StudentInfoCell: UITableViewCell {
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}

//MARK: - Extension|StudentInfoCell
extension StudentInfoCell {
    func populateCell(with student: Student) {
        self.textLabel?.text = (student.name + ", " + student.age)
        self.textLabel?.textColor = Constants.titleColor
        self.detailTextLabel?.text = student.address
        self.detailTextLabel?.textColor = Constants.titleColor
    }
}
