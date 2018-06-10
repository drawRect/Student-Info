//
//  ProfessorListViewModel.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 Dash. All rights reserved.
//

import Foundation
import UIKit

class ProfessorListViewModel: NSObject {
    var professors: Professors = Professors(professors:[]) {
        didSet {
            professors.professors.forEach { (s) in
                let filteredKeys = mutableSectionValues.keys.filter({k in k==s.sexualType})
                if filteredKeys.isEmpty {
                    mutableSectionValues[s.sexualType] = [s]
                }else {
                    var profs = mutableSectionValues[filteredKeys.first!]
                    profs?.append(s)
                    mutableSectionValues[s.sexualType] = profs
                }
            }
            sectionedProfessors = mutableSectionValues
        }
    }
    var sectionedProfessors: [SexualType: [Professor]] = [:]
    var mutableSectionValues: [SexualType: [Professor]] = [:]

    func getDataSource(completion: @escaping(_ result: Result<Professors>)->())  {
        do {
            let resource = Resource<Professors>(name: "Professors", ext: "json", parse: { (data) -> Professors? in
                return try? JSONDecoder().decode(Professors.self, from: data)
            })
            let professors = try JSONLoader.loadMockFile(with: resource, bundle: .main)
            completion(Result.success(professors))
        } catch (let e){
            completion(Result.failure(e))
        }
    }
}

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
}
