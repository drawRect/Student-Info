//
//  StudentListViewModel.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation
import UIKit

class StudentListViewModel: NSObject {
    var students: Students?
    
    var sectionedStudents: [SexualType: [Student]] {
        if let students = students?.students {
            return Dictionary(grouping: students,by:{$0.sexualType})
        }
        return [:]
    }
    
    func getDataSource(completion: @escaping(_ result: Result<Students>)->())  {
        do {
            let resource = Resource(name: Constants.studJSONFileName, A: Students.self)
            let students = try JSONLoader.loadMockFile(resource)
            completion(Result.success(students))
        } catch (let e){
            completion(Result.failure(e))
        }
    }
}

//MARK: - Extension|StudentListViewModel
extension StudentListViewModel: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionedStudents.keys.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sexuality = Array(sectionedStudents.keys)[section]
        return sectionedStudents[sexuality]?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = StudentInfoCell(style: .subtitle, reuseIdentifier: StudentInfoCell.reuseIdentifier)
        let sexuality = Array(sectionedStudents.keys)[indexPath.section]
        let student = (sectionedStudents[sexuality]?[indexPath.row])!
        cell.populateCell(with:student)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(sectionedStudents.keys)[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = Constants.headerColor
    }
}
