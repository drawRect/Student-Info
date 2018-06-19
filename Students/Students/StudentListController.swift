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
    private var tableDataSource: TableViewHelper<StudentListViewModel,StudentInfoCell,Student>?

    //MARK: - Overridden functions
    override func loadView() {
        super.loadView()
        view = StudentListView(frame: UIScreen.main.bounds)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Students"
        loadDataSource()
    }
}

//MARK: - Extension|StudentsListController
extension StudentsListController {
    private func setUpDataSource(with models: Students) {
        let viewModel = StudentListViewModel()
        viewModel.students = models
        tableDataSource = TableViewHelper(source: viewModel) {cell,model in
            cell.configureCell(model: model)
            return cell
        }
        _view.tableView.tableFooterView = UILabel("\(models.students.count) Students")
        _view.tableView.dataSource = tableDataSource
        _view.tableView.delegate = viewModel
        _view.tableView.reloadData()
    }
    private func loadDataSource() {
        StudentListViewModel.getDataSource(completion: {[weak self] (result) in
            switch result {
            case let .success(s):
                DispatchQueue.main.async {
                    self?.setUpDataSource(with: s)
                }
            case let .failure(e):
                debugPrint(e.localizedDescription)
            }
        })
    }
}
