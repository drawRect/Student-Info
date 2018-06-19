//
//  StudentListViewModel.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 DrawRect. All rights reserved.
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

    class func getDataSource(completion: @escaping(_ result: Result<Students>)->()) {
        do {
            let resource = Resource(name: Constants.studJSONFileName, A: Students.self)
            let students = try JSONLoader.loadMockFile(resource)
            completion(Result.success(students))
        } catch (let e){
            completion(Result.failure(e))
        }
    }
}

extension StudentListViewModel: TVDataSourceConfigurable {
    typealias T = Student
    var array: [Student] {
        return students?.students ?? []
    }

    func numberOfSections() -> Int {
        return sectionedStudents.keys.count
    }
    func numberOfRows(in section: Int) -> Int {
        let sexuality = Array(sectionedStudents.keys)[section]
        return sectionedStudents[sexuality]?.count ?? 0
    }
    func cellForRow(at indexPath: IndexPath) -> T {
        let sexuality = Array(sectionedStudents.keys)[indexPath.section]
        let student = (sectionedStudents[sexuality]?[indexPath.row])!
        return student
    }

    func titleForHeader(in section: Int) -> String? {
        return Array(sectionedStudents.keys)[section].rawValue
    }
}

extension StudentListViewModel: UITableViewDelegate {

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = Constants.headerColor
    }
}
