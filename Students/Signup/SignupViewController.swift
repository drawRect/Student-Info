//
//  SignupViewController.swift
//  Students
//
//  Created by Ranjith Kumar on 6/21/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

final class SignupViewController: UIViewController {

    private let viewModel = SignupViewModel()

    let nameTextField: UITextField = {
        let txtfield = UITextField()
        txtfield.placeholder = "Name"
        txtfield
            |> baseTextFieldStyle
            <> nextRetunKeyStyle
            <> setAutocorrectionNo

        return txtfield
    }()

    let emailTextField: UITextField = {
        let txtfield = UITextField()
        txtfield
            |> baseTextFieldStyle
            <> emailTextFieldStyle
            <> setAutocorrectionNo
            <> nextRetunKeyStyle

        return txtfield
    }()

    let phoneTextField: UITextField = {
        let txtfield = UITextField()
        txtfield.placeholder = "Phone"

        txtfield
            |> baseTextFieldStyle
            <> setAutocorrectionNo
            <> phoneToolbar

        txtfield.keyboardType = .numberPad

        let nxtBarButton = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextButtonTapped))
        (txtfield.inputAccessoryView as? UIToolbar)?.items?.append(nxtBarButton)

        return txtfield
    }()

    let passwordTextField: UITextField = {
        let txtfield = UITextField()
        txtfield
            |> baseTextFieldStyle
            <> nextRetunKeyStyle
            <> passwordTextFieldStyle

        return txtfield
    }()

    let confirmPasswordTextField: UITextField = {
        let txtfield = UITextField()
        txtfield
            |> baseTextFieldStyle
            <> nextRetunKeyStyle
            <> passwordTextFieldStyle
            <> doneReturnKeyStyle

        return txtfield
    }()

    let submitButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Signup", for: .normal)
        btn |> baseButtonStyle
        (btn,false) |> toggleThemeStyle
        return btn
    }()

    let loginButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Already have an account?. Tap to Login", for: .normal)
        btn |> baseButtonStyle
        return btn
    }()
    let forgotPasswordButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("I forgot my password", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        btn |> baseButtonStyle
        return btn
    }()

    let moreButton: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Login options...", for: .normal)
        btn |> baseButtonStyle

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
            forgotPasswordButton,
            moreButton
            ])
        sv.arrangedSubviews.forEach(setTranslatesAutoresizingMaskIntoConstraints)
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.distribution = .fillEqually
        sv.axis = .vertical
        sv.spacing = 16
        sv.isLayoutMarginsRelativeArrangement = true
        sv.layoutMargins = UIEdgeInsets(top: 32, left: 16, bottom: 32, right: 16)

        return sv
    }()

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        return scrollView
    }()


    func installConstraints() {

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 65),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
            ])
    }

    @objc func nextButtonTapped() {
        view.endEditing(true)
        passwordTextField.becomeFirstResponder()
    }

    //MARK: - Overriden functions


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Signup"
        view.addTapGesture()
        view.addSubview(scrollView)
        viewAddOns()
        setupViewModel()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //  nameTextField.becomeFirstResponder()
    }

    //MARK: - Private functions
    private func viewAddOns() {
        [nameTextField,
         emailTextField,
         passwordTextField,
         confirmPasswordTextField,
         phoneTextField
            ].forEach{
                $0.addTarget(self, action: #selector(didTypeTextChanges), for: .editingChanged)
                $0.addTarget(self, action: #selector(didReturnTextField(_:)), for: .editingDidEndOnExit)
        }
        submitButton.addTarget(self, action: #selector(submitClicked), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(moreButtonClicked), for: .touchUpInside)
        installConstraints()
    }

    private func setupViewModel() {
        viewModel.isSubmitBtnEnabled.bind { [unowned self] in
            (self.submitButton,$0!) |> toggleThemeStyle
        }
    }

    //MARK: - Selectors
    @objc func didTypeTextChanges() {
        viewModel.nameTxt.value = nameTextField.text
        viewModel.emailTxt.value = emailTextField.text
        viewModel.phoneTxt.value = phoneTextField.text
        viewModel.passwordTxt.value = passwordTextField.text
        viewModel.confirmPasswordTxt.value = confirmPasswordTextField.text
        viewModel.isSubmitBtnEnabled.value = (((nameTextField.text?.count)! > 0) && (emailTextField.text?.count)! > 0 && ((phoneTextField.text?.count)! > 0) && ((passwordTextField.text?.count)! > 0) && ((confirmPasswordTextField.text?.count)! > 0))
    }
    @objc func didReturnTextField(_ textField: UITextField) {
        textField.resignFirstResponder()

        switch textField {
        case nameTextField: emailTextField.becomeFirstResponder()
        case emailTextField: phoneTextField.becomeFirstResponder()
        case phoneTextField: passwordTextField.becomeFirstResponder()
        case passwordTextField: confirmPasswordTextField.becomeFirstResponder()
        case confirmPasswordTextField: submitClicked()
        default:
            view.endEditing(true)
        }
    }

    @objc private func submitClicked() {
        print(#function)
    }
    
    @objc private func loginBtnClicked() {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func moreButtonClicked() {
        let alertController = UIAlertController(title: "Choose your Login option", message: nil, preferredStyle: .actionSheet)
        let anonymousAction = UIAlertAction(title: "Anonymous", style: .default) { _ in }
        let loginWithGoogleAction = UIAlertAction(title: "Login with 'Google'", style: .default) { _ in }
        let loginWithFaceBookAction = UIAlertAction(title: "Login with 'FaceBook'", style: .default) { _ in }
        let loginWithTwitterAction = UIAlertAction(title: "Login with 'Twitter'", style: .default) { _ in }
        let loginWithGitHubAction = UIAlertAction(title: "Login with 'GitHub'", style: .default) { _ in }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        [anonymousAction,
         loginWithGoogleAction,
         loginWithFaceBookAction,
         loginWithTwitterAction,
         loginWithGitHubAction,
         cancelAction].forEach(alertController.addAction(_:))
        present(alertController, animated: true, completion: nil)
    }

}

