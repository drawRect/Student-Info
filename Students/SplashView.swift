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
        loginBtn.setTitle("Login", for: .normal)
        loginBtn |> baseButtonStyle
        return loginBtn
    }()

    lazy var signupBtn: UIButton = {
        let signupBtn = UIButton(type: .system)
        signupBtn.setTitle("Signup", for: .normal)
        signupBtn |> baseButtonStyle
        return signupBtn
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginBtn,signupBtn])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()

    private func initialSetup() {
        backgroundColor = .white
        addSubview(stackView)
    }

    public func installConstraints() {
        initialSetup()
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                //            stackView.topAnchor.constraint(equalTo: topAnchor, constant:(frame.height-100)/2),
                stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
                stackView.rightAnchor.constraint(equalTo: rightAnchor,constant: -8),
                stackView.heightAnchor.constraint(equalToConstant: 100),
                stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant:-10)
                ])
        } else {
            // Fallback on earlier versions
        }
    }
}
