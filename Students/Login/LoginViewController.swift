//
//  LoginViewController.swift
//  SampleUserApp
//
//  Created by Sonata on 19/06/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    private var _view: LoginView{return view as! LoginView}
    private let viewModel: LoginViewModel = LoginViewModel()
    
    override func loadView() {
        super.loadView()
        view = LoginView(frame: UIScreen.main.bounds)
    }
    
    override func viewDidLoad() {
        title = "Login"
        super.viewDidLoad()
        miscellaneousTasks()
    }

    private func miscellaneousTasks() {
        [_view.emailTextField, _view.passwordField].forEach{ $0.delegate = self}
        _view.loginButton.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        _view.installConstraints()
    }
    
    @objc private func loginBtnTapped() {
        print(#function)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        switch textField {
        case _view.emailTextField: _view.passwordField.becomeFirstResponder()
        case _view.passwordField: loginBtnTapped()
        default:
            self.view.endEditing(true)
        }
        return true
    }
}
