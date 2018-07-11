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
    
    private let students: Students
    init(_ students: Students) {
        self.students = students
    }
    private var sectionedStudents: [SexualType: [Student]] {
        return Dictionary(grouping: students.students, by:{$0.sexualType})
    }

    private func getSexuality(for section: Int) -> SexualType {
        return Array(sectionedStudents.keys)[section]
    }

}

extension StudentListViewModel: TVDataSourceConfigurable {
    typealias T = Student
    var array: [Student] {
        return students.students
    }
    
    func numberOfSections() -> Int {
        return sectionedStudents.keys.count
    }
    func numberOfRows(in section: Int) -> Int {
        let sexuality = getSexuality(for: section)
        return sectionedStudents[sexuality]?.count ?? 0
    }
    func cellForRow(at indexPath: IndexPath) -> T? {
        let sexuality = getSexuality(for: indexPath.section)
        return (sectionedStudents[sexuality]?[indexPath.row])
    }
    
    func titleForHeader(in section: Int) -> String? {
        return getSexuality(for: section).rawValue
    }
}

extension StudentListViewModel: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = Constants.Colors.header
    }
}
