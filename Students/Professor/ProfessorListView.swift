//
//  ProfessorListView.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 DrawRect. All rights reserved.
//

import UIKit

final class ProfessorListView: UIView {

    //MARK: - iVars
    public let tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.register(ProfessorInfoCell.classForCoder(), forCellReuseIdentifier: ProfessorInfoCell.reuseIdentifier)
        tv.tableFooterView = UIView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    //MARK: - Overriden functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        NSLayoutConstraint.activate([tableView.leftAnchor.constraint(equalTo: leftAnchor),
                                     tableView.topAnchor.constraint(equalTo: topAnchor),
                                     tableView.rightAnchor.constraint(equalTo: rightAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: bottomAnchor)])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
