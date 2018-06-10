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
    var students: Students = Students.init(students:[]) {
        didSet {
            students.students.forEach { (s) in
                let filteredKeys = mutableSectionValues.keys.filter({k in k==s.sexualType})
                if filteredKeys.isEmpty {
                    mutableSectionValues[s.sexualType] = [s]
                }else {
                    var studs = mutableSectionValues[filteredKeys.first!]
                    studs?.append(s)
                    mutableSectionValues[s.sexualType] = studs
                }
            }
            sectionedStudents = mutableSectionValues
        }
    }
    var sectionedStudents: [SexualType: [Student]] = [:]
    var mutableSectionValues: [SexualType: [Student]] = [:]

    func getDataSource(completion: @escaping(_ result: Result<Students>)->())  {
        do {
            let resource = Resource<Students>(name: "Students", ext: "json", parse: { (data) -> Students? in
                try? JSONDecoder().decode(Students.self, from: data)
            })
            let students = try JSONLoader.loadMockFile(with: resource, bundle: .main)
            completion(Result.success(students))
        } catch (let e){
            completion(Result.failure(e))
        }
    }
}

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
}
