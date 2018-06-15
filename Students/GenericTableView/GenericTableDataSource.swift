//
//  GenericTableDataSource.swift
//  GenericTableView
//
//  Created by Ranjith Kumar on 6/15/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewDataSourceRuler {
    associatedtype A //ViewModel
    associatedtype B //Model
    var collection: [B] {get} //[Model] Default case
    var ruler: A {get}
    
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func cellForRow(at indexPath: IndexPath) -> B
}

extension TableViewDataSourceRuler {
    func numberOfSections() -> Int {
        return 1
    }
    func numberOfRows(in section: Int) -> Int {
        return collection.count
    }
    func cellForRow(at indexPath: IndexPath) -> B {
        let model = collection[indexPath.row]
        return model
    }
}

extension StudentListViewModel: TableViewDataSourceRuler {
    
    typealias A = StudentListViewModel
    typealias B = Student
    
    var collection: [Student] {
        get {
            return (students?.students)!
        }
    }
    
    var ruler: A {
        return self
    }
    
    func numberOfSections() -> Int {
        return sectionedStudents.keys.count
    }
    func numberOfRows(in section: Int) -> Int {
        let sexuality = Array(sectionedStudents.keys)[section]
        return sectionedStudents[sexuality]?.count ?? 0
    }
    func cellForRow(at indexPath: IndexPath) -> B {
        let sexuality = Array(sectionedStudents.keys)[indexPath.section]
        let student = (sectionedStudents[sexuality]?[indexPath.row])!
        return student
    }
}

/// This class is a simple, immutable, declarative data source for UITableView
final class GenericTableDataSource<V, T, W:TableViewDataSourceRuler> : NSObject, UITableViewDataSource where V: UITableViewCell {
    
    private var models: [T] // Going to Deprecate because 'T' we are going to use it from TableViewDataSourceRuler
    private let configureCell: CellConfiguration
    typealias CellConfiguration = (V, T) -> V // This one also we can lift to Protocol, and use combination from Cell,Model with hep of protocol
    public var viewModel: W? // Dont make it optional, because on top this only we are going to create. And this one is not a ViewModel. Instead we are going to have an object like Mediator for GenericTableDatSource and the ViewModel
    
    /*Notes: ViewModel is the guy knows how to present the data. So obviously we have keep this guys as reference for presenting the data on TablView
     - And if you want the older way. You can use the Protocol extension function automatically invoke. so it will work nicer as like old code of GenericTableDataSource
     */
    
    init(models: [T], configureCell: @escaping CellConfiguration) {
        self.models = models
        self.configureCell = configureCell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (viewModel?.numberOfSections())!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.numberOfSections())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: V = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let model = viewModel?.cellForRow(at: indexPath)
        cell.selectionStyle = .none
        return cell
//        return configureCell(cell, model)
    }
    
    /// MARK: updates for search
    func update(models: [T]) {
        self.models = models
    }
}
