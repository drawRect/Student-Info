//
//  SignupViewController.swift
//  Students
//
//  Created by Ranjith Kumar on 6/21/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

final class SignupViewController: UIViewController {

    private var _view: SignupView{return view as! SignupView}
    private let viewModel: SignupViewModel = SignupViewModel()

    //MARK: - Overriden functions
    override func loadView() {
        super.loadView()
        view = SignupView(frame: Constants.Screen.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Signup"
        viewAddOns()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //  nameTextField.becomeFirstResponder()
    }

    //MARK: - Private functions
    private func viewAddOns() {
        [_view.nameTextField,
         _view.emailTextField,
         _view.confirmPasswordTextField,
         _view.passwordTextField].forEach({$0.delegate = self})
        _view.submitButton.addTarget(self, action: #selector(submitClicked), for: .touchUpInside)
        _view.loginButton.addTarget(self, action: #selector(loginBtnClicked), for: .touchUpInside)
        _view.moreButton.addTarget(self, action: #selector(moreButtonClicked), for: .touchUpInside)
        _view.installConstraints()
    }

    @objc private func submitClicked() {
        print(#function)
    }
    
    @objc private func loginBtnClicked() {
        let vc = LoginViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc private func moreButtonClicked() {
        let alertController = UIAlertController(title: "Choose your signup method", message: nil, preferredStyle: .actionSheet)
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

extension SignupViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()

        switch textField {
        case _view.nameTextField: _view.emailTextField.becomeFirstResponder()
        case _view.emailTextField: _view.phoneTextField.becomeFirstResponder()
        case _view.passwordTextField: _view.confirmPasswordTextField.becomeFirstResponder()
        case _view.confirmPasswordTextField: submitClicked()
        default:
            _view.endEditing(true)
        }
        return true
    }
}
