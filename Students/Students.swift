//
//  Students.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation

struct Students: Codable {
    
    var response:[[String:String]] //BLOB
    
    var sectionedStudents:[SexualType:[Student]] = [:]
    var mutableSectionValues:[SexualType:[Student]] = [:]

    private enum CodingKeys: String, CodingKey {
        case response = "Students"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        response = try container.decode([[String:String]].self, forKey: .response)
        serialize()
    }
    
    mutating func serialize() {
        self.response.forEach { (resp) in
            guard let jsonData = try? JSONSerialization.data(withJSONObject: resp, options: JSONSerialization.WritingOptions.prettyPrinted) else { return }
            
            if let s = try? JSONDecoder().decode(Student.self, from: jsonData) {
                let filteredKeys = mutableSectionValues.keys.filter({k in k==s.sexualType})
                if filteredKeys.isEmpty {
                    mutableSectionValues[s.sexualType] = [s]
                }else {
                    var studs = mutableSectionValues[filteredKeys.first!]
                    studs?.append(s)
                    mutableSectionValues[s.sexualType] = studs
                }
            }
        }
        sectionedStudents = mutableSectionValues
    }
}
