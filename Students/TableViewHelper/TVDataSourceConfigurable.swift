//
//  TVDataSourceConfigurable.swift
//  Students
//
//  Created by Ranjith Kumar on 6/19/18.
//  Copyright © 2018 Dash. All rights reserved.
//

import Foundation
import UIKit

//MARK: Basic TableView datasource methods
protocol TVDataSourceConfigurable {
    //MARK: T->What type of data you are hold it in Array ie.[T]
    associatedtype T
    //MARK: This getter will get the value from end user (ie.ViewModel)
    //High level collection. Its like finally whatever the computation you have done, final list are ready lets give this to computed property
    var array: [T] {get}

    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func cellForRow(at indexPath: IndexPath) -> T?
    func titleForHeader(in section: Int) -> String?
}

extension TVDataSourceConfigurable {
    func numberOfSections() -> Int {
        return 1
    }
    func numberOfRows(in section: Int) -> Int {
        return array.count
    }
    func cellForRow(at indexPath: IndexPath) -> T? {
        return array[indexPath.row]
    }
    func titleForHeader(in section: Int) -> String? {
        return nil
    }
}
