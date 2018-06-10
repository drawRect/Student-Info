//
//  ProfessorListView.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import UIKit

class ProfessorListView: UIView {

    //MARK: - iVars
    public let tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.register(ProfessorInfoCell.classForCoder(), forCellReuseIdentifier: ProfessorInfoCell.reuseIdentifier)
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
}
