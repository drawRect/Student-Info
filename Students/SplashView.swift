//
//  SplashView.swift
//  Students
//
//  Created by Ranjith Kumar on 7/12/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

class SplashView: UIView {

    lazy var loginBtn: UIButton = {
        let loginBtn = UIButton(type: .system)
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.setTitle("Login", for: .normal)
        return loginBtn
    }()

    lazy var signupBtn: UIButton = {
        let signupBtn = UIButton(type: .system)
        signupBtn.translatesAutoresizingMaskIntoConstraints = false
        signupBtn.setTitle("Signup", for: .normal)
        return signupBtn
    }()

    lazy var stackView: UIStackView = {

        let stackView = UIStackView(arrangedSubviews: [loginBtn,signupBtn])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()

    private func initialSetup() {
        backgroundColor = .white
        addSubview(stackView)
    }

    public func installConstraints() {
        initialSetup()
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant:(frame.height-100)/2),
            stackView.leftAnchor.constraint(equalTo: leftAnchor),
            stackView.rightAnchor.constraint(equalTo: rightAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100)
            ])
    }
}
