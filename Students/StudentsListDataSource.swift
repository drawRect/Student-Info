//
//  StudentsListDataSource.swift
//  Students
//
//  Created by Ranjith Kumar on 6/9/18.
//  Copyright © 2018 Dash. All rights reserved.
//

import Foundation

struct StudentListDataSource {

    private let students: Students
    var sectionedStudents: [SexualType: [Student]] = [:]
    var mutableSectionValues: [SexualType: [Student]] = [:]

    init?(students: Students?) {
        if let stud = students {
            self.students = stud
            self.students.students.forEach { (s) in
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
        }else {
            return nil
        }
    }
}

extension StudentListDataSource {
    static func getStudentDataSource() -> StudentListDataSource? {
        var stud: Students?
        do {
            let resource = Resource<Students>(name: "Students", ext: "json", parse: { (data) -> Students? in
                try? JSONDecoder().decode(Students.self, from: data)
            })
            stud = try JSONLoader.loadMockFile(with: resource,bundle: .main)
        } catch (let e){
            debugPrint(e.localizedDescription)
        }
        return StudentListDataSource(students: stud)
    }
}
