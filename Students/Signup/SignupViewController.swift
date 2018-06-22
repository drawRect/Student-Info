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
        txtfield.placeholder = "Password"
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
        txtfield.placeholder = "Confirm Password"
        txtfield.borderStyle = .roundedRect
        txtfield.isSecureTextEntry = true
        txtfield.font = .systemFont(ofSize: 17)
        txtfield.autocorrectionType = .no
        txtfield.returnKeyType = .done
        txtfield.delegate = self
        return txtfield
    }()

    private lazy var submitButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Submit", for: .normal)
        btn.backgroundColor = Constants.titleColor
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        return btn
    }()

    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Already have an account? Tap to Login", for: .normal)
        btn.backgroundColor = Constants.titleColor
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = .boldSystemFont(ofSize: 17)
        return btn
    }()
    private lazy var forgotPasswordButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Forgot the password? Tap to get back", for: .normal)
        btn.backgroundColor = Constants.headerColor
        btn.layer.cornerRadius = 8
        btn.titleLabel?.font = .boldSystemFont(ofSize: 17)
        return btn
    }()

    private lazy var stackView: UIStackView = {
        let height = 8*50 + 7*8
        let sv = UIStackView(frame: CGRect(x:20,y:100,width:Int(view.bounds.width-(2*20)),height:height))
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.spacing = 8
        sv.addArrangedSubview(nameTextField)
        sv.addArrangedSubview(emailTextField)
        sv.addArrangedSubview(phoneTextField)
        sv.addArrangedSubview(passwordTextField)
        sv.addArrangedSubview(confirmPasswordTextField)
        sv.addArrangedSubview(submitButton)
        sv.addArrangedSubview(loginButton)
        sv.addArrangedSubview(forgotPasswordButton)
        return sv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Signup"
        view.backgroundColor = .white
        view.addSubview(stackView)
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
        nameTextField.becomeFirstResponder()
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
