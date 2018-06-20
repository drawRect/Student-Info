//
//  StudentListController.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 DrawRect. All rights reserved.
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
    private func loadDataSource() {
        fetchStudentsJSON(completion: {[weak self] (result) in
            switch result {
            case let .success(studs):
                DispatchQueue.main.async {
                    let viewModel = StudentListViewModel(studs)
                    self?.tableDataSource = TableViewHelper(source: viewModel) {cell,model in
                        cell.configureCell(model: model)
                        return cell
                    }
                    self?._view.tableView.tableFooterView = UILabel(footerString:"\(studs.students.count) Students")
                    self?._view.tableView.dataSource = self?.tableDataSource
                    self?._view.tableView.delegate = viewModel
                    self?._view.tableView.reloadData()
                }
            case let .failure(e):
                debugPrint(e.localizedDescription)
            }
        })
    }
    
    typealias StudentJSONResponse = (_ result: Result<Students>)->()
    
    private func fetchStudentsJSON(completion: @escaping(StudentJSONResponse)) {
        do {
            let resource = Resource(name: Constants.studJSONFileName, A: Students.self)
            let students = try JSONLoader.loadMockFile(resource)
            completion(Result.success(students))
        } catch (let e){
            completion(Result.failure(e))
        }
    }
}
