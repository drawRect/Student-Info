//
//  StudentListController.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation
import UIKit

class StudentsListController:UIViewController {
    private lazy var _view:StudentListView = {return view as! StudentListView}()
    private let viewModel:StudentListViewModel = {
        do {
            let students = try JSONLoader.loadMockFile(named: "Students",bundle: .main)
            let dataSource = StudentListDataSource.init(students: students)
            return StudentListViewModel(dataSource: dataSource)
        } catch let e as MockLoaderError{
            e.desc()
        }catch{
            debugPrint("could not read Mock json file :(")
        }
        let students = Students.init(students: [])
        let dataSource = StudentListDataSource.init(students: students)
        return StudentListViewModel(dataSource: dataSource)
    }()

    //MARK: - Overridden functions
    override func loadView() {
        super.loadView()
        view = StudentListView.init(frame: UIScreen.main.bounds)
        _view.getTableView().delegate = self
        _view.getTableView().dataSource = self
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Students"
    }
}

extension StudentsListController:UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsIn(section: section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = StudentInfoCell.init(style: .subtitle, reuseIdentifier: StudentInfoCell.reuseIdentifier())
        let student = viewModel.cellForRowAt(indexPath: indexPath)
        cell.populateCell(with:student)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.titleForHeaderIn(section: section)
    }
}
