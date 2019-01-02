//
//  Box<T>.swift
//  Students
//
//  Created by Ranjith Kumar on 12/17/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation

class Box<T> {
    var value:T? {
        didSet {
            observer?(value)
        }
    }
    var observer:((T?) -> Void)?

    func bind(observer:@escaping ((T?) -> Void)) {
        self.observer = observer
    }
}
