//
//  Student.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 DrawRect. All rights reserved.
//

import Foundation

struct Student: Decodable {
    let name,age,address,sex: String
}

enum SexualType: String {
    case Male = "Male"
    case Female = "Female"
    case Other = "Other"
}

extension Student {
    var sexualType: SexualType {
        switch self.sex {
        case SexualType.Male.rawValue:
            return .Male
        case SexualType.Female.rawValue:
            return .Female
        default:
            return .Other
        }
    }
}

