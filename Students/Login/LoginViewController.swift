//
//  LoginViewController.swift
//  SampleUserApp
//
//  Created by Sonata on 19/06/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    private lazy var emailTextField: UITextField = {
        
        let txtfield = UITextField()
        txtfield.delegate = self
        
        txtfield
            |> baseTextFieldStyle
            <> emailTextFieldStyle
            <> setAutocorrectionNo
            <> nextRetunKeyStyle
            <> addLeftNRightView

        return txtfield
    }()
    
    private lazy var passwordField: UITextField = {
        
        var txtfield = UITextField()
        txtfield.delegate = self

        txtfield
            |> baseTextFieldStyle
            <> nextRetunKeyStyle
            <> passwordTextFieldStyle
            <> addLeftNRightView

        return txtfield
    }()
    
    private lazy var submitButton: UIButton = {
        
        let btn = UIButton(type: .system)
        btn.setTitle("Login", for: .normal)

        btn |> baseButtonStyle

        return btn
    }()
    
    private var getLayoutGuide: UILayoutGuide {
        if #available(iOS 11.0, *) {
            return view.safeAreaLayoutGuide
        }
        return view.layoutMarginsGuide
    }
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [
            emailTextField,
            passwordField,
            submitButton
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
    
    override func viewDidLoad() {
        title = "Login"
        view.backgroundColor = .white
        view.addSubview(stackView)

        //Why i have given 4*50? because of layout guide
        //isLayoutMarginsRelativeArrangement
        let height:CGFloat = 4*50 + 2*16
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: getLayoutGuide.leftAnchor),
            stackView.topAnchor.constraint(equalTo: getLayoutGuide.topAnchor, constant: 65),
            stackView.rightAnchor.constraint(equalTo: getLayoutGuide.rightAnchor),
            stackView.heightAnchor.constraint(equalToConstant: height)
            ])
        super.viewDidLoad()
    }
    
    @objc private func didTapSubmitBtn() {
        print(#function)
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        switch textField {
        case emailTextField: passwordField.becomeFirstResponder()
        case passwordField: didTapSubmitBtn()
        default:
            self.view.endEditing(true)
        }
        return true
    }
}
