//
//  SignupView.swift
//  Students
//
//  Created by Ranjith Kumar on 6/26/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

final class SignupView: UIView {

    //MARK: - UIElements
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

    private func initialSetup() {
        backgroundColor = .white
        addTapGesture()
        addSubview(scrollView)
    }

    func installConstraints() {
        initialSetup()

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor, constant: 65),
            scrollView.leftAnchor.constraint(equalTo: leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
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
        endEditing(true)
        passwordTextField.becomeFirstResponder()
    }

}
