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
    func includeLeftView() {
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
    }
    func includeRightView() {
        self.rightViewMode = .always
        self.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
    }
}

extension UITextField: AccessoryView {}

struct ScreenSize {
    static let width = 375
    static let height = 667
}

class LoginViewController : UIViewController {
    
    /*private let customField: (UITextField, UITextBorderStyle, String, UITextContentType) -> Void = {tf,ph,bs, tct  in
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = ph
        tf.borderStyle = bs
        tf.setLeftViewMode()
        if #available(iOS 11, *) {
            tf.textContentType = tct
        }
    }*/
    
    private let uNameField: (UITextField) -> Void = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Email ID"
        $0.borderStyle = .roundedRect
        $0.includeLeftView()
        if #available(iOS 11, *) {
            $0.textContentType = .username
        }
    }
    private let pwdField: (UITextField) -> Void = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Password"
        $0.isSecureTextEntry = true
        $0.borderStyle = .roundedRect
        $0.includeLeftView()
        if #available(iOS 11, *) {
            $0.textContentType = .password
        }
    }
    private let submitBtn: (UIButton) -> Void = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Submit", for: .normal)
        $0.layer.cornerRadius = 5.0
        $0.backgroundColor = .orange
        $0.layer.borderWidth = 1.0
        $0.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    var userNameField: UITextField = UITextField()
    var passwordField: UITextField = UITextField()
    var submitButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        setUpViewElements()
        super.viewDidLoad()
    }
    private func setUpViewElements() {
        self.view.frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height)
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isTranslucent = false
        uNameField(userNameField)
        pwdField(passwordField)
        submitBtn(submitButton)
        self.view.addSubview(userNameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(submitButton)
        setUpConstraints()
    }
    
    private func setUpConstraints() {
        let layoutGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            self.userNameField.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: 20),
            self.userNameField.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: 44),
            self.userNameField.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor, constant: -20),
            self.userNameField.bottomAnchor.constraint(equalTo: self.passwordField.topAnchor, constant: -20)
            ])
        NSLayoutConstraint.activate([
            self.passwordField.leftAnchor.constraint(equalTo: self.userNameField.leftAnchor),
            self.passwordField.rightAnchor.constraint(equalTo: self.userNameField.rightAnchor),
            self.passwordField.topAnchor.constraint(equalTo: self.userNameField.bottomAnchor, constant: 20),
            self.passwordField.bottomAnchor.constraint(equalTo: self.submitButton.topAnchor, constant: -20),
            ])
        NSLayoutConstraint.activate([
            self.submitButton.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 80),
            self.submitButton.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 20),
            self.submitButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -80),
            self.submitButton.bottomAnchor.constraint(lessThanOrEqualTo: self.view.bottomAnchor, constant: 20)
            ])
    }
}
