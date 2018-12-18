//
//  SignupViewController.swift
//  Students
//
//  Created by Ranjith Kumar on 6/21/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

final class SignupViewController: UIViewController {

    private lazy var _view = view as! SignupView
    private let viewModel = SignupViewModel()

    //MARK: - Overriden functions
    override func loadView() {
        super.loadView()
        view = SignupView(frame: Constants.Screen.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Signup"
        viewAddOns()
        setupViewModel()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //  nameTextField.becomeFirstResponder()
    }

    //MARK: - Private functions
    private func viewAddOns() {
        [_view.nameTextField,
         _view.emailTextField,
         _view.passwordTextField,
         _view.confirmPasswordTextField,
         _view.phoneTextField
            ].forEach{
                $0.addTarget(self, action: #selector(didTypeTextChanges), for: .editingChanged)
                $0.addTarget(self, action: #selector(didReturnTextField(_:)), for: .editingDidEndOnExit)
        }
        _view.submitButton.addTarget(self, action: #selector(submitClicked), for: .touchUpInside)
        _view.loginButton.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        _view.moreButton.addTarget(self, action: #selector(moreButtonClicked), for: .touchUpInside)
        _view.installConstraints()
    }

    private func setupViewModel() {
        viewModel.isSubmitBtnEnabled.bind { [unowned self] in
            (self._view.submitButton,$0!) |> toggleThemeStyle
        }
    }

    //MARK: - Selectors
    @objc func didTypeTextChanges() {
        viewModel.nameTxt.value = _view.nameTextField.text
        viewModel.emailTxt.value = _view.emailTextField.text
        viewModel.phoneTxt.value = _view.phoneTextField.text
        viewModel.passwordTxt.value = _view.passwordTextField.text
        viewModel.confirmPasswordTxt.value = _view.confirmPasswordTextField.text
        viewModel.isSubmitBtnEnabled.value = (((_view.nameTextField.text?.count)! > 0) && (_view.emailTextField.text?.count)! > 0 && ((_view.phoneTextField.text?.count)! > 0) && ((_view.passwordTextField.text?.count)! > 0) && ((_view.confirmPasswordTextField.text?.count)! > 0))
    }
    @objc func didReturnTextField(_ textField: UITextField) {
        textField.resignFirstResponder()

        switch textField {
        case _view.nameTextField: _view.emailTextField.becomeFirstResponder()
        case _view.emailTextField: _view.phoneTextField.becomeFirstResponder()
        case _view.phoneTextField: _view.passwordTextField.becomeFirstResponder()
        case _view.passwordTextField: _view.confirmPasswordTextField.becomeFirstResponder()
        case _view.confirmPasswordTextField: submitClicked()
        default:
            _view.endEditing(true)
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

