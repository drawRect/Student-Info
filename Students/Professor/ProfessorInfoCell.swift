//
//  ProfessorInfoCell.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation
import UIKit

class ProfessorInfoCell: UITableViewCell {
    class var reuseIdentifier: String {
        return String(describing: self)
    }
}

//MARK: - Extension|ProfessorInfoCell
extension ProfessorInfoCell {
    func populateCell(with professor: Professor) {
        self.textLabel?.text = (professor.name + ". " + professor.qualification + ", " + professor.age)
        self.detailTextLabel?.text = professor.address
    }
}
