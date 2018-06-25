//
//  SignupViewController.swift
//  Students
//
//  Created by Ranjith Kumar on 6/21/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

final class SignupViewController: UIViewController {

    private lazy var nameTextField: UITextField = {
        let txtfield = UITextField()
        txtfield.placeholder = "Name"
        txtfield.delegate = self

        let roundedTextFieldStyle =
            baseTextFieldStyle
                <> nextRetunKeyStyle
                <> setAutocorrectionNo

        roundedTextFieldStyle(txtfield)

        return txtfield
    }()

    private lazy var emailTextField: UITextField = {

        let txtfield = UITextField()
        txtfield.delegate = self

        let roundedRectStyle =
            baseTextFieldStyle
                <> emailTextFieldStyle
                <> setAutocorrectionNo
                <> nextRetunKeyStyle
        roundedRectStyle(txtfield)

        return txtfield
    }()

    private lazy var phoneTextField: UITextField = {

        let txtfield = UITextField()
        txtfield.placeholder = "Phone"

        let roundedRectTxtFieldStyle =
            baseTextFieldStyle
                <> setAutocorrectionNo
        roundedRectTxtFieldStyle(txtfield)

        let toolBar = nextOnlyToolBar()
        let barButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self , action: #selector(didTapNextBtn))
        toolBar.items?.append(barButtonItem)
        txtfield.inputAccessoryView = toolBar

        return txtfield
    }()

    private lazy var passwordTextField: UITextField = {

        let txtfield = UITextField()
        txtfield.delegate = self
        let roundedTextFieldStyle =
            baseTextFieldStyle
                <> nextRetunKeyStyle
                <> passwordTextFieldStyle

        roundedTextFieldStyle(txtfield)

        return txtfield
    }()

    private lazy var confirmPasswordTextField: UITextField = {

        let txtfield = UITextField()
        txtfield.delegate = self
        let roundedTextFieldStyle =
            baseTextFieldStyle
                <> nextRetunKeyStyle
                <> passwordTextFieldStyle
                <> doneReturnKeyStyle
        
        roundedTextFieldStyle(txtfield)

        return txtfield
    }()

    private lazy var submitButton: UIButton = {

        let btn = UIButton(type: .system)
        baseButtonStyle(btn)
        btn.setTitle("Signup", for: .normal)

        return btn
    }()

    private lazy var loginButton: UIButton = {

        let btn = UIButton(type: .system)
        baseButtonStyle(btn)
        btn.setTitle("Already have an account?. Tap to Login", for: .normal)
        btn.addTarget(self, action: #selector(didTapLoginBtn), for: .touchUpInside)
        return btn
    }()
    private lazy var forgotPasswordButton: UIButton = {
        
        let btn = UIButton(type: .system)
        baseButtonStyle(btn)
        btn.setTitle("I forgot my password", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()

    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            nameTextField,
            emailTextField,
            phoneTextField,
            passwordTextField,
            confirmPasswordTextField,
            submitButton,
            loginButton,
            forgotPasswordButton
            ])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.spacing = 16
        sv.isLayoutMarginsRelativeArrangement = true
        sv.layoutMargins = UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)

        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Signup"
        view.backgroundColor = .white
        view.addSubview(stackView)
        
        let height = 8*50 + 7*16
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            stackView.heightAnchor.constraint(equalToConstant: CGFloat(height))
            ])
    }

    @objc private func didTapNextBtn() {
        view.endEditing(true)
        passwordTextField.becomeFirstResponder()
    }

    @objc private func didTapSubmitBtn() {
        print(#function)
    }
    
    @objc private func didTapLoginBtn() {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//                nameTextField.becomeFirstResponder()
    }

}

extension SignupViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        switch textField {
        case nameTextField: emailTextField.becomeFirstResponder()
        case emailTextField: phoneTextField.becomeFirstResponder()
        case passwordTextField: confirmPasswordTextField.becomeFirstResponder()
        case confirmPasswordTextField: didTapSubmitBtn()
        default:
            self.view.endEditing(true)
        }
        return true
    }
}
