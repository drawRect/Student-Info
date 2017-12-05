//
//  Students.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation

struct Students {
    struct SerializebleKeys {
        static let kStudentsResponseKey:String = "Students"
    }
    let sectionedStudents:[SexualType:[Student]]
    let response:[Dictionary<String,String>]//BLOB
    init(resp:Dictionary<String,[[String:String]]>) {
        response = resp[SerializebleKeys.kStudentsResponseKey]!
        var mutableSectionValues:[SexualType:[Student]] = [:]
        response.forEach { (resp) in
            let s = Student.init(resp:resp)
            let filteredKeys = mutableSectionValues.keys.filter({k in k==s.sexualType})
            if filteredKeys.count==0 {
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
