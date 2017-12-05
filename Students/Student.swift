//
//  Student.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation

enum SexualType:String {
    case Male = "Male"
    case Female = "Female"
    case Other = "Other"
}

struct Student {
    struct SerializebleKeys {
        static let kStudentNameKey:String = "name"
        static let kStudentAgeKey:String = "age"
        static let kStudentColorKey:String = "color"
        static let kStudentAddressKey:String = "address"
        static let kStudentSexKey:String = "sex"
    }
    let name,age,color,address,sex:String
    var sexualType:SexualType{
        switch self.sex {
        case SexualType.Male.rawValue:
            return SexualType.Male
        case SexualType.Female.rawValue:
            return SexualType.Female
        default:
            return .Other
        }
    }
    let response:Dictionary<String,String>//BLOB
    init(resp:Dictionary<String,String>) {
        response = resp
        self.name = resp[SerializebleKeys.kStudentNameKey]!
        self.age = resp[SerializebleKeys.kStudentAgeKey]!
        self.color = resp[SerializebleKeys.kStudentColorKey]!
        self.address = resp[SerializebleKeys.kStudentAddressKey]!
        self.sex = resp[SerializebleKeys.kStudentSexKey]!
    }
}

