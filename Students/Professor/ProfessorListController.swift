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
    private let viewModel: ProfessorListViewModel = ProfessorListViewModel()

    //MARK: - Overridden functions
    override func loadView() {
        super.loadView()
        view = ProfessorListView(frame: UIScreen.main.bounds)
        _view.tableView.delegate = viewModel
        _view.tableView.dataSource = viewModel
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
        viewModel.getDataSource(completion: {[weak self] (result) in
            switch result {
            case let .success(p):
                DispatchQueue.main.async {
                    self?.viewModel.professors = p
                    self?._view.tableView.tableFooterView = UILabel(footerString:"\(p.professors.count) Professors")
                    self?._view.tableView.reloadData()
                }
            case let .failure(e):
                debugPrint(e.localizedDescription)
            }
        })
    }
}
