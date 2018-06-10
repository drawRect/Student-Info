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
    func numberOfSections() -> Int
    func numberOfRowsIn(section: Int) -> Int
    func cellForRowAt(indexPath:IndexPath) -> _source
    func titleForHeaderIn(section:Int) -> String
}

class StudentListViewModel: NSObject {
    let dataSource: StudentListDataSource

    init(dataSource: StudentListDataSource) {
        self.dataSource = dataSource
    }
}

extension StudentListViewModel: TableListViewModel {
    typealias _source = Student
    public func numberOfSections() -> Int {
        return dataSource.sectionedStudents.keys.count
    }
    public func numberOfRowsIn(section: Int) -> Int {
        let sexuality = Array(dataSource.sectionedStudents.keys)[section]
        return dataSource.sectionedStudents[sexuality]?.count ?? 0
    }
    public func cellForRowAt(indexPath: IndexPath) -> Student {
        let sexuality = Array(dataSource.sectionedStudents.keys)[indexPath.section]
        return (dataSource.sectionedStudents[sexuality]?[indexPath.row])!
    }
    public func titleForHeaderIn(section:Int) -> String {
        return Array(dataSource.sectionedStudents.keys)[section].rawValue
    }
}
