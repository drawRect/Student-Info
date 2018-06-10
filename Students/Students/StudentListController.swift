//
//  StudentListController.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation
import UIKit

class StudentsListController: UIViewController {
    private lazy var _view: StudentListView = view as! StudentListView
    private let viewModel: StudentListViewModel = StudentListViewModel()

    //MARK: - Overridden functions
    override func loadView() {
        super.loadView()
        view = StudentListView(frame: UIScreen.main.bounds)
        _view.tableView.delegate = self.viewModel
        _view.tableView.dataSource = self.viewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Students"
        loadDataSource()
    }
}

extension StudentsListController {
    private func loadDataSource() {
        viewModel.getDataSource(completion: {[weak self] (result) in
            switch result {
            case .success(let s):
                DispatchQueue.main.async {
                    self?.viewModel.students = s
                    self?._view.tableView.reloadData()
                }
            case .failure(let r):
                debugPrint(r.localizedDescription)
            }
        })
    }
}
