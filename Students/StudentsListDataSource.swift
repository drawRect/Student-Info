//
//  StudentsListDataSource.swift
//  Students
//
//  Created by Ranjith Kumar on 6/9/18.
//  Copyright © 2018 Dash. All rights reserved.
//

import Foundation

struct StudentListDataSource {

    private let students:Students
    var sectionedStudents:[SexualType:[Student]] = [:]
    var mutableSectionValues:[SexualType:[Student]] = [:]

    init(students:Students) {
        self.students = students
        buildSectionBasedDataSource()
    }

    mutating func buildSectionBasedDataSource() {
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
