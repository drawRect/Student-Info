//
//  Professor.swift
//  Students
//
//  Created by Ranjith Kumar on 6/10/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation

struct Professor: Decodable {
    let name,age,address,sex,qualification: String
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
