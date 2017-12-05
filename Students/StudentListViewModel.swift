//
//  StudentListViewModel.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation

protocol TableListViewModel {
    associatedtype _source
    func numberOfSections()->Int
    func numberOfRowsIn(section:Int)->Int
    func cellForRowAt(indexPath:IndexPath)->_source
    func titleForHeaderIn(section:Int)->String
}

class StudentListViewModel:NSObject {
    private let students:Students
    init(response:JSONSignature) {
        students = Students.init(resp: response)
    }
}
extension StudentListViewModel:TableListViewModel {
    typealias _source = Student
    public func numberOfSections()->Int {
        return students.sectionedStudents.keys.count
    }
    public func numberOfRowsIn(section:Int)->Int {
        let sexuality = Array(students.sectionedStudents.keys)[section]
        return students.sectionedStudents[sexuality]?.count ?? 0
    }
    public func cellForRowAt(indexPath:IndexPath)->Student {
        let sexuality = Array(students.sectionedStudents.keys)[indexPath.section]
        return (students.sectionedStudents[sexuality]?[indexPath.row])!
    }
    public func titleForHeaderIn(section:Int)->String {
        return Array(students.sectionedStudents.keys)[section].rawValue
    }
    
}
