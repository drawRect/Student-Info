//
//  StudentListView.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import UIKit

class StudentListView: UIView {

    //MARK: - iVars
    public let tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.register(StudentInfoCell.classForCoder(), forCellReuseIdentifier: StudentInfoCell.reuseIdentifier)
        return tv
    }()

    //MARK: - Overriden functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView.frame = bounds
        addSubview(tableView)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
