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
    var professors: Professors?
    var sectionedProfessors: [SexualType: [Professor]] {
        if let professors = professors?.professors {
            return Dictionary(grouping: professors,by:{$0.sexualType})
        }
        return [:]
    }
    
    func getDataSource(completion: @escaping(_ result: Result<Professors>)->())  {
        do {
            let resource = Resource(name: Constants.profJSONFileName, A: Professors.self)
            let professors = try JSONLoader.loadMockFile(resource)
            completion(Result.success(professors))
        } catch (let e){
            completion(Result.failure(e))
        }
    }
}

//MARK: - Extension|ProfessorListViewModel
extension ProfessorListViewModel: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionedProfessors.keys.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sexuality = Array(sectionedProfessors.keys)[section]
        return sectionedProfessors[sexuality]?.count ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ProfessorInfoCell(style: .subtitle, reuseIdentifier: ProfessorInfoCell.reuseIdentifier)
        let sexuality = Array(sectionedProfessors.keys)[indexPath.section]
        let professor = (sectionedProfessors[sexuality]?[indexPath.row])!
        cell.populateCell(with: professor)
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return Array(sectionedProfessors.keys)[section].rawValue
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int){
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = Constants.headerColor
    }
}
