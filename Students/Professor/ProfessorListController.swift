//
//  StudentListController.swift
//  Students
//
//  Created by Ranjith Kumar on 12/5/17.
//  Copyright © 2017 DrawRect. All rights reserved.
//

import Foundation
import UIKit

class ProfessorListController: UIViewController {
    private lazy var _view: ProfessorListView = view as! ProfessorListView
    private var tableDataSource: TableViewHelper<ProfessorListViewModel,ProfessorInfoCell,Professor>?

    //MARK: - Overridden functions
    override func loadView() {
        super.loadView()
        view = ProfessorListView(frame: UIScreen.main.bounds)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Professors"
        loadDataSource()
    }
}

//MARK: - Extension|ProfessorListController
extension ProfessorListController {
    private func loadDataSource() {
        fetchProfessorsJSON(completion: {[weak self] (result) in
            switch result {
            case let .success(profs):
                DispatchQueue.main.async {
                    let viewModel = ProfessorListViewModel(profs)
                    self?.tableDataSource = TableViewHelper(source: viewModel) {cell,model in
                        cell.configureCell(model: model)
                        return cell
                    }
                    self?._view.tableView.tableFooterView = UILabel(footerString:"\(profs.professors.count) Professors")
                    self?._view.tableView.dataSource = self?.tableDataSource
                    self?._view.tableView.delegate = viewModel
                    self?._view.tableView.reloadData()
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
