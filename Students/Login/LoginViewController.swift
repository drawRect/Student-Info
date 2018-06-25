//
//  LoginViewController.swift
//  SampleUserApp
//
//  Created by Sonata on 19/06/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

protocol AccessoryView {
    func includeLeftView()
    func includeRightView()
}

extension AccessoryView where Self: UITextField {
    
    var getView: UIView {
        return UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
    }
    
    func includeLeftView() {
        self.leftViewMode = .always
        self.leftView = getView
    }
    func includeRightView() {
        self.rightViewMode = .always
        self.rightView = getView
    }
}

extension UITextField: AccessoryView {}

struct ScreenSize {
    static let width = 375
    static let height = 667
}

class LoginViewController : UIViewController {
    
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
    
    private lazy var passwordField: UITextField = {
        
        let txtfield = UITextField()
        txtfield.delegate = self
        let roundedTextFieldStyle =
            baseTextFieldStyle
                <> nextRetunKeyStyle
                <> passwordTextFieldStyle
        
        roundedTextFieldStyle(txtfield)
        
        return txtfield
    }()
    
    private lazy var submitButton: UIButton = {
        
        let btn = UIButton(type: .system)
        baseButtonStyle(btn)
        btn.setTitle("Login", for: .normal)
        
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
        
        let height:CGFloat = 3*50 + 2*16
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
