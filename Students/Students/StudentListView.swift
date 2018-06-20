//
//  StudentListView.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 DrawRect. All rights reserved.
//

import UIKit

class StudentListView: UIView {

    //MARK: - iVars
    public let tableView: UITableView = {
        let tv = UITableView()
        tv.register(StudentInfoCell.self, forCellReuseIdentifier: StudentInfoCell.reuseIdentifier)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    //MARK: - Overriden functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
