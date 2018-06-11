//
//  Resource.swift
//  Students
//
//  Created by Ranjith Kumar on 6/10/18.
//  Copyright © 2018 Dash. All rights reserved.
//

import Foundation

struct Resource<A> {
    let name: String
    let ext: String = "json"
    let A: A.Type
}
