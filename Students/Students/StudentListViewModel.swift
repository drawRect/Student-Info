//
//  StudentListViewModel.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 DrawRect. All rights reserved.
//

import Foundation

struct StudentListViewModel {
    let student: Student
}

extension StudentListViewModel {
    var nameNAge:String {
        return (student.name + ", " + student.age)
    }
}


