//
//  ProfessorInfoCell.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 DrawRect. All rights reserved.
//

import Foundation
import UIKit

final class ProfessorInfoCell: UITableViewCell {
    override init(style: UITableViewCell.CellStyle = .subtitle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extension|ProfessorInfoCell
extension ProfessorInfoCell {
    func configureCell(model: Professor) {
        self.textLabel?.text = (model.name + ". " + model.qualification + ", " + model.age)
        self.detailTextLabel?.text = model.address
        self.textLabel?.textColor = Constants.Colors.title
        self.detailTextLabel?.textColor = Constants.Colors.title
    }
}
