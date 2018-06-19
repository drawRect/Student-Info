//
//  GenericTableDataSource.swift
//  Students
//
//  Created by Ranjith Kumar on 6/15/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

protocol TableViewDataSource {
    associatedtype T
    //Setter -> Maybe Asynchronous call
    //Getter -> By default getting values
    var models: [T] {set get}

    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func cellForRow(at indexPath: IndexPath) -> T
    func titleForHeader(in section: Int) -> String?

    //Todo:Refinement required
    //This func belongs to UITableViewDelegate
    func willDisplayHeaderView(view: UIView, forSection section: Int)

}

extension TableViewDataSource {
    func numberOfSections() -> Int {
        return 1
    }
    func numberOfRows(in section: Int) -> Int {
        return models.count
    }
    func cellForRow(at indexPath: IndexPath) -> T {
        return models[indexPath.row]
    }
    func titleForHeader(in section: Int) -> String? {
        return nil
    }
    func willDisplayHeaderView(view: UIView, forSection section: Int) {}
}


//Todo:Refinement required for list of Generic params
//Todo:Concentrate on Namings of classes and params
final class GenericTableDataSource<V:TableViewDataSource,A,B>: NSObject, UITableViewDataSource,UITableViewDelegate where A:UITableViewCell{

    private let source: V
    private let configureCell: CellConfiguration
    typealias CellConfiguration = (A, B) -> A

    init(source: V, configureCell: @escaping CellConfiguration) {
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
        let cell: A = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let model = source.cellForRow(at: indexPath) as! B
        return configureCell(cell,model)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return source.titleForHeader(in: section)
    }

    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        source.willDisplayHeaderView(view: view, forSection: section)
    }

}
