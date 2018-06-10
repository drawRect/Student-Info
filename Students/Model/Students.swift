//
//  Students.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation

struct Resource<A> {
    let name: String
    let ext: String
    let parse: (Data) -> A?
}

struct Students: Decodable {
    let students: [Student]
}

