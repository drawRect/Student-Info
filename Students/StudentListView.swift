//
//  StudentListView.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import UIKit
//Rules:- Dont expose UIElements as Public
//If you want write helper func to get an instance
class StudentListView: UIView {
    //MARK: - iVars
    private let tableView: UITableView = {
        let tv = UITableView.init(frame: CGRect.zero)
        tv.register(StudentInfoCell.classForCoder(), forCellReuseIdentifier: StudentInfoCell.reuseIdentifier())
        tv.tableFooterView = UIView()
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
    //MARK: - Public functions
    public func getTableView()->UITableView {
        return tableView
    }
}

