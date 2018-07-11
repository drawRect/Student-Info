//
//  Result.swift
//  Students
//
//  Created by Ranjith Kumar on 7/11/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation

enum Result<Value> {
    case success(Value)
    case failure(Error)
}
