//
//  ProfessorListViewModel.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 DrawRect. All rights reserved.
//

import Foundation
import UIKit

class ProfessorListViewModel: NSObject {
    let professors: Professors
    init(_ professors: Professors) {
        self.professors = professors
    }
    var sectionedProfessors: [SexualType: [Professor]] {
        return Dictionary(grouping: professors.professors,by:{$0.sexualType})
    }
    
    private func getSexuality(for section: Int) -> SexualType {
        return Array(sectionedProfessors.keys)[section]
    }
}

//MARK: - Extension|ProfessorListViewModel
extension ProfessorListViewModel: TVDataSourceConfigurable {
    typealias T = Professor
    var array: [Professor] {
        return professors.professors
    }

    func numberOfSections() -> Int {
        return sectionedProfessors.keys.count
    }
    func numberOfRows(in section: Int) -> Int {
        let sexuality = getSexuality(for: section)
        return sectionedProfessors[sexuality]?.count ?? 0
    }
    func cellForRow(at indexPath: IndexPath) -> T? {
        let sexuality = getSexuality(for: indexPath.section)
        return (sectionedProfessors[sexuality]?[indexPath.row])
    }

    func titleForHeader(in section: Int) -> String? {
        return getSexuality(for: section).rawValue
    }
}

extension ProfessorListViewModel: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = Constants.headerColor
    }
}

