//
//  Student.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation

enum SexualType: String, Codable {
    case Male = "Male"
    case Female = "Female"
    case Other = "Other"
}

struct Student: Codable {
    
    let name,age,color,address,sex: String
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
    private enum CodingKeys: String, CodingKey {
        case name
        case age
        case color
        case address
        case sex
    }
}

