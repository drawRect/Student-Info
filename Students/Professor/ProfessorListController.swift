//
//  StudentListController.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 DrawRect. All rights reserved.
//

import Foundation
import UIKit

final class ProfessorListController: UIViewController {
    private var tableDataSource: TableViewHelper<ProfessorListViewModel,ProfessorInfoCell,Professor>?
    public let tableView: UITableView = {
        let tv = UITableView(frame: .zero)
        tv.register(ProfessorInfoCell.classForCoder(), forCellReuseIdentifier: ProfessorInfoCell.reuseIdentifier)
        tv.tableFooterView = UIView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    //MARK: - Overriden functions
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        NSLayoutConstraint.activate([tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                                     tableView.topAnchor.constraint(equalTo: view.topAnchor),
                                     tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)])
        title = "Professors"
        loadDataSource()
    }
}

//MARK: - Extension|ProfessorListController
extension ProfessorListController {
    private func loadDataSource() {
        fetchProfessorsJSON(completion: {[unowned self] (result) in
            switch result {
            case let .success(profs):
                DispatchQueue.main.async {
                    let viewModel = ProfessorListViewModel(profs)
                    self.tableDataSource = TableViewHelper(source: viewModel) {cell,model in
                        cell.configureCell(model: model)
                        return cell
                    }
                    self.tableView.tableFooterView = UILabel(footerString:"\(profs.professors.count) Professors")
                    self.tableView.dataSource = self.tableDataSource
                    self.tableView.reloadData()
                }
            case let .failure(e):
                debugPrint(e.localizedDescription)
            }
        })
    }
    
    private typealias ProfessorsJSONResponse = (_ result: Result<Professors>)->()

    private func fetchProfessorsJSON(completion: @escaping(ProfessorsJSONResponse)) {
        do {
            let resource = Resource(name: Constants.JSONs.professors, A: Professors.self)
            let professors = try JSONLoader.loadMockFile(resource)
            completion(Result.success(professors))
        } catch (let e){
            completion(Result.failure(e))
        }
    }
}
