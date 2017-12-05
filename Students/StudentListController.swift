//
//  StudentListController.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation
import UIKit

//MARK: - Models
typealias JSONSignature = Dictionary<String,[[String:String]]>

let jsonResponse:JSONSignature = ["Students":[["name":"Mani","age":"27","color":"Red","address":"Bangalore","sex": "Male"],["name":"Ravi","age":"22","color":"bule","address":"Kelerala","sex":"Male"],["name":"Siva","age":"25","color":"Green","address":"Mumbai","sex":"Male"],["name":"Priya","age":"19","color":"yello","address":"Dehli","sex":"Female"],["name":"Rani","age":"17","color":"Red","address":"Chennai","sex":"Female"],["name":"Gopalan","age":"37","color":"Red","address":"Delhi","sex":"Other"],["name":"Kamal","age":"47","color":"Red","address":"Kolkata","sex":"Other"]]]

class StudentsListController:UIViewController {
    private lazy var _view:StudentListView = {return view as! StudentListView}()
    private let viewModel:StudentListViewModel = StudentListViewModel.init(response: jsonResponse)
   
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
