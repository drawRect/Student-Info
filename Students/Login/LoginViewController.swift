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
    
    fileprivate let viewModel = LoginViewModel()

    let emailTextField: UITextField = {
        let textField = UITextField()
        textField
            |> baseTextFieldStyle
            <> emailTextFieldStyle
            <> setAutocorrectionNo
            <> nextRetunKeyStyle
        return textField
    }()

    let passwordField: UITextField = {
        let textField = UITextField()
        textField
            |> baseTextFieldStyle
            <> passwordTextFieldStyle
            <> doneReturnKeyStyle
        return textField
    }()

    let loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Login", for: .normal)
        btn |> baseButtonStyle
        (btn,false) |> toggleThemeStyle
        return btn
    }()


    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            emailTextField,
            passwordField,
            loginButton
            ])
        sv.arrangedSubviews.forEach(setTranslatesAutoresizingMaskIntoConstraints)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.spacing = 16
        sv.isLayoutMarginsRelativeArrangement = true
        sv.layoutMargins = UIEdgeInsets.init(top: 32, left: 16, bottom: 32, right: 16)
        return sv
    }()
    
    override func viewDidLoad() {
        title = "Login"
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)

        //Why i have given 4*50? because of layout guide
        //isLayoutMarginsRelativeArrangement
        let height:CGFloat = 4*50 + 2*16
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: view.layoutGuide.leftAnchor),
            stackView.topAnchor.constraint(equalTo: view.layoutGuide.topAnchor, constant: 65),
            stackView.rightAnchor.constraint(equalTo: view.layoutGuide.rightAnchor),
            stackView.heightAnchor.constraint(equalToConstant: height)
            ])

        miscellaneousTasks()
        setupViewModel()
    }

    private func setupViewModel() {
        viewModel.isLoginEnabled.bind { [unowned self] in
            (self.loginButton,$0!) |> toggleThemeStyle
        }
    }

    private func miscellaneousTasks() {
        [emailTextField,
         passwordField
            ].forEach{
                $0.addTarget(self, action: #selector(didTypeTextChanges), for: .editingChanged)
                $0.addTarget(self, action: #selector(didReturnTextField(_:)), for: .editingDidEndOnExit)
        }
        loginButton.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
    }

    @objc func didTypeTextChanges() {
        viewModel.emailTxt.value = emailTextField.text
        viewModel.passwordTxt.value = passwordField.text
        viewModel.isLoginEnabled.value = (((emailTextField.text?.count)! > 0) && (passwordField.text?.count)! > 0)
    }

    @objc func didReturnTextField(_ textField: UITextField) {
        textField.resignFirstResponder()

        switch textField {
        case emailTextField: passwordField.becomeFirstResponder()
        case passwordField: loginBtnTapped()
        default:
            view.endEditing(true)
        }
    }
    
    @objc private func loginBtnTapped() {
        print(#function)
    }
}

