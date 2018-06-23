//
//  SignupViewController.swift
//  Students
//
//  Created by Ranjith Kumar on 6/21/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    private lazy var nameTextField: UITextField = {
        let txtfield = UITextField()
        txtfield.translatesAutoresizingMaskIntoConstraints = false
        txtfield.placeholder = "Name"
        txtfield.borderStyle = .roundedRect
        txtfield.font = .systemFont(ofSize: 17)
        txtfield.autocorrectionType = .no
        txtfield.returnKeyType = .next
        txtfield.delegate = self
        return txtfield
    }()

    private lazy var emailTextField: UITextField = {
        let txtfield = UITextField()
        txtfield.translatesAutoresizingMaskIntoConstraints = false
        txtfield.placeholder = "Email"
        txtfield.keyboardType = .emailAddress
        txtfield.borderStyle = .roundedRect
        txtfield.font = .systemFont(ofSize: 17)
        txtfield.autocorrectionType = .no
        txtfield.returnKeyType = .next
        txtfield.delegate = self
        return txtfield
    }()

    private lazy var phoneTextField: UITextField = {
        let txtfield = UITextField()
        txtfield.translatesAutoresizingMaskIntoConstraints = false
        txtfield.placeholder = "Phone"
        txtfield.borderStyle = .roundedRect
        txtfield.keyboardType = .numberPad
        txtfield.font = .systemFont(ofSize: 17)

        let toolbar = UIToolbar(frame: CGRect(x:0,y:0,width:view.frame.width,height:50))
        let flexibleSapceBtnItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let barButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(didTapNextBtn))
        toolbar.items = [flexibleSapceBtnItem,barButtonItem]
        txtfield.inputAccessoryView = toolbar

        return txtfield
    }()

    private lazy var passwordTextField: UITextField = {
        let txtfield = UITextField()
        txtfield.translatesAutoresizingMaskIntoConstraints = false
        txtfield.placeholder = "••••••••••••••••"
        txtfield.borderStyle = .roundedRect
        txtfield.isSecureTextEntry = true
        txtfield.font = .systemFont(ofSize: 17)
        txtfield.autocorrectionType = .no
        txtfield.returnKeyType = .next
        txtfield.delegate = self
        return txtfield
    }()

    private lazy var confirmPasswordTextField: UITextField = {
        let txtfield = UITextField()
        txtfield.translatesAutoresizingMaskIntoConstraints = false
        txtfield.placeholder = "••••••••••••••••"
        txtfield.borderStyle = .roundedRect
        txtfield.isSecureTextEntry = true
        txtfield.font = .systemFont(ofSize: 17)
        txtfield.autocorrectionType = .no
        txtfield.returnKeyType = .done
        txtfield.delegate = self
        return txtfield
    }()

    private lazy var submitButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Signup", for: .normal)
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)

        return btn
    }()

    private lazy var loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Already have an account?. Tap to Login", for: .normal)
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)

        return btn
    }()
    private lazy var forgotPasswordButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("I forgot my password", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        btn.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)

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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        nameTextField.becomeFirstResponder()
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
