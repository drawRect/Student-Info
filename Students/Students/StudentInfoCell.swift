//
//  StudentInfoCell.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 DrawRect. All rights reserved.
//

import Foundation
import UIKit

final class StudentInfoCell: UITableViewCell {
    override init(style: UITableViewCellStyle = .subtitle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extension|StudentInfoCell
extension StudentInfoCell {
    func configureCell(model: Student) { 
        self.textLabel?.text = (model.name + ", " + model.age)
        self.textLabel?.textColor = Constants.titleColor
        self.detailTextLabel?.text = model.address
        self.detailTextLabel?.textColor = Constants.titleColor
    }
}
