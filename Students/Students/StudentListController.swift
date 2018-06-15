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
//    private let viewModel: StudentListViewModel = StudentListViewModel()
    private var tableDataSource: GenericTableDataSource<StudentInfoCell, StudentListViewModel>?

    //MARK: - Overridden functions
    override func loadView() {
        super.loadView()
        view = StudentListView(frame: UIScreen.main.bounds)
//        _view.tableView.delegate = viewModel
//        _view.tableView.dataSource = viewModel
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
        tableDataSource = GenericTableDataSource(models: models.students.map { StudentListViewModel(student: $0) }) { cell, model in
            cell.configure(viewModel: model)
            return cell
        }
        _view.tableView.dataSource = tableDataSource
        _view.tableView.reloadData()
    }
    private func loadDataSource() {
        StudentListViewModel.getDataSource(completion: {[weak self] (result) in
            switch result {
            case let .success(s):
                DispatchQueue.main.async {
                    self?.setUpDataSource(with: s)
//                    self?.viewModel.students = s
                    self?._view.tableView.tableFooterView = UILabel("\(s.students.count) Students")
//                    self?._view.tableView.reloadData()
                }
            case let .failure(e):
                debugPrint(e.localizedDescription)
            }
        })
    }
}
