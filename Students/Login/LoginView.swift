//
//  LoginView.swift
//  Students
//
//  Created by Sonata on 26/06/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

final class LoginView: UIView {
    
    //MARK: UIElements
    
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
        sv.layoutMargins = UIEdgeInsetsMake(32, 16, 32, 16)
        return sv
    }()
    
    private func initialSetup() {
        backgroundColor = .white
        addSubview(stackView)
    }
    
    func installConstraints() {
        initialSetup()

        //Why i have given 4*50? because of layout guide
        //isLayoutMarginsRelativeArrangement
        let height:CGFloat = 4*50 + 2*16
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor),
            stackView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 65),
            stackView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor),
            stackView.heightAnchor.constraint(equalToConstant: height)
            ])
    }
}
