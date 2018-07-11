//
//  Operators.swift
//  Students
//
//  Created by Ranjith Kumar on 6/26/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation

//func second<A,B,C>(_ f: @escaping (B) -> C) -> ((A,B)) -> (A,C) {
//    return {pair in
//        return (pair.0, f(pair.1))
//    }
//}


extension Int {
    func incr() -> Int {
        return self+1
    }

    func square() -> Int {
        return self * self
    }
}



