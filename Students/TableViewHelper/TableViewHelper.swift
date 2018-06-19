//
//  TableViewHelper.swift
//  Students
//
//  Created by Ranjith Kumar on 6/15/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

/*
 What is the use of having TableViewHelper('BrandNew') Helper ie.Generic.TableViewDelegate&DataSource

 Scenarios:
 1)Having array of data, want to populate on UITableView with UITableViewCell
 2)Having array of data, want to populate on UITableView with Custom UITableViewCell
 3)Having some data(ie.T might be array or dictionary or set or model or parent model), want to populate on UITableView with UITableViewCell or Custom UITableViewCell

 UITableViewDelegate & UITableViewDataSource:
 Note: Apple itself already maintaing some decent need of using these predefined protocols. So here on top of this we are creating our protocols Like. NumberOfRows,NumberOfSections,CellForRowAtIndexpath is completely bridge<TVDataSourceConfigurable>.

 Pathway: We are writing this TableView Helper to enrich the basic&complex([DataType] & T) usage of TableView Datasource and delegate methods, we can avoid lot of redundant methods
 */

/*
 A -> TVDataSourceConfigurable(Basic TableView.DataSource protocol goes to here)
 B -> UITableViewCell or Custom TableViewCell
 C -> T String or Model or whatEver (ie.[T]-> What is about T?)
 */

//You can't add extension for this class:
//Refer:https://stackoverflow.com/questions/48386613/make-an-extensions-of-generic-class-in-swift4
final class TableViewHelper<A: TVDataSourceConfigurable, B, C>: NSObject, UITableViewDataSource where B: UITableViewCell {
    private let source: A
    private let configureCell: CellConfiguration
    typealias CellConfiguration = (B, C) -> B

    init(source: A, configureCell: @escaping CellConfiguration) {
        self.source = source
        self.configureCell = configureCell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return source.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: B = tableView.dequeueReusableCell(forIndexPath: indexPath)
        if let model = source.cellForRow(at: indexPath) as? C {
            return configureCell(cell,model)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return source.titleForHeader(in: section)
    }

}
