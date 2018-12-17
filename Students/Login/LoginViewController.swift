//
//  LoginViewController.swift
//  SampleUserApp
//
//  Created by Sonata on 19/06/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

final class LoginViewController: UIViewController {
    
    private lazy var _view = view as! LoginView
    fileprivate let viewModel = LoginViewModel()
    
    override func loadView() {
        super.loadView()
        view = LoginView(frame: Constants.Screen.bounds)
    }
    
    override func viewDidLoad() {
        title = "Login"
        super.viewDidLoad()
        _view.installConstraints()
        miscellaneousTasks()
        setupViewModel()
    }

    private func setupViewModel() {
        viewModel.isLoginEnabled.bind { [unowned self] in
            (self._view.loginButton,$0!) |> toggleThemeStyle
        }
    }

    private func miscellaneousTasks() {
        [_view.emailTextField,
         _view.passwordField
            ].forEach{
                $0.addTarget(self, action: #selector(didTypeTextChanges), for: .editingChanged)
                $0.addTarget(self, action: #selector(didReturnTextField(_:)), for: .editingDidEndOnExit)
        }
        _view.loginButton.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
    }

    @objc func didTypeTextChanges() {
        viewModel.emailTxt.value = _view.emailTextField.text
        viewModel.passwordTxt.value = _view.passwordField.text
        viewModel.isLoginEnabled.value = (((_view.emailTextField.text?.count)! > 0) && (_view.passwordField.text?.count)! > 0)
    }

    @objc func didReturnTextField(_ textField: UITextField) {
        textField.resignFirstResponder()

        switch textField {
        case _view.emailTextField: _view.passwordField.becomeFirstResponder()
        case _view.passwordField: loginBtnTapped()
        default:
            self.view.endEditing(true)
        }
    }
    
    @objc private func loginBtnTapped() {
        print(#function)
    }
}

