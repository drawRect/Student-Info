//
//  StudentListController.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 DrawRect. All rights reserved.
//

import Foundation
import UIKit

final class StudentsListController: UIViewController {
    private var tableDataSource: TableViewHelper<StudentsListController,StudentInfoCell,StudentListViewModel>?
    var dataSource:[StudentListViewModel] = []

    public let tableView: UITableView = {
        let tv = UITableView()
        tv.register(StudentInfoCell.self, forCellReuseIdentifier: StudentInfoCell.reuseIdentifier)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    //MARK: - Overridden functions
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Students"
        loadDataSource()

        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
    }
}

//MARK: - Extension|StudentsListController
extension StudentsListController {
   @objc private func loadDataSource() {
        showLoadingViewWithMessage(message: "Loading...")
        fetchStudentsJSON(completion: {[unowned self] (result) in
            print(Date())
            self.hideLoadingView()
            switch result {
            case let .success(studs):
                DispatchQueue.main.async {
                    self.dataSource = studs.students.map(StudentListViewModel.init)
                    self.tableDataSource = TableViewHelper(source: self) {cell,model in
                        cell.configureCell(model: model)
                        return cell
                    }

                    self.tableView.tableFooterView = UILabel(footerString:"\(studs.students.count) Students")
                    self.tableView.dataSource = self.tableDataSource
                    self.tableView.delegate = self
                    self.tableView.reloadData()
                }
            case let .failure(e):
                debugPrint(e.localizedDescription)
            }
        })
    }
    
    private typealias StudentJSONResponse = (_ result: Result<Students>)->()
    
    private func fetchStudentsJSON(completion: @escaping(StudentJSONResponse)) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+5) {
            do {
                let resource = Resource(name: Constants.JSONs.students, A: Students.self)
                let students = try JSONLoader.loadMockFile(resource)
                completion(Result.success(students))
            } catch (let e){
                completion(Result.failure(e))
            }
        }
    }

    private var sectionedStudents : [SexualType:[StudentListViewModel]] {
        return Dictionary(grouping: array, by:{$0.student.sexualType})
    }

    private func getSexuality(section: Int) -> SexualType {
        return Array(sectionedStudents.keys)[section]
    }

}


extension StudentsListController: TVDataSourceConfigurable {

    typealias T = StudentListViewModel
    var array: [StudentListViewModel] {
        return dataSource
    }

    func numberOfSections() -> Int {
        return sectionedStudents.keys.count
    }
    func numberOfRows(in section: Int) -> Int {
        let sexuality = getSexuality(section: section)
        return sectionedStudents[sexuality]?.count ?? 0
    }
    func cellForRow(at indexPath: IndexPath) -> T? {
        let sexuality = getSexuality(section: indexPath.section)
        return sectionedStudents[sexuality]?[indexPath.row]
    }

    func titleForHeader(in section: Int) -> String? {
        return getSexuality(section: section).rawValue
    }

}

extension StudentsListController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = Constants.Colors.header
    }
}
