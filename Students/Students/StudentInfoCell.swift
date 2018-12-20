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
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extension|StudentInfoCell
extension StudentInfoCell {
    func configureCell(model: StudentListViewModel) {
        self.textLabel?.text = model.nameNAge
        self.textLabel?.textColor = Constants.Colors.title
        self.detailTextLabel?.text = model.student.address
        self.detailTextLabel?.textColor = Constants.Colors.title
    }
}
