//
//  GenericTableDataSource.swift
//  GenericTableView
//
//  Created by Ranjith Kumar on 6/15/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

/// This class is a simple, immutable, declarative data source for UITableView
final class GenericTableDataSource<V, T> : NSObject, UITableViewDataSource where V: UITableViewCell {
    
    private var models: [T]
    private let configureCell: CellConfiguration
    typealias CellConfiguration = (V, T) -> V
    
    init(models: [T], configureCell: @escaping CellConfiguration) {
        self.models = models
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: V = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let model = models[indexPath.row]
        cell.selectionStyle = .none
        return configureCell(cell, model)
    }
    
    /// MARK: updates for search
    func update(models: [T]) {
        self.models = models
    }
}
