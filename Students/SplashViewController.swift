//
//  SplashViewController.swift
//  Students
//
//  Created by Ranjith Kumar on 7/12/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

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

    lazy var anonymousBtn: UIButton = {
        let anonyBtn = UIButton(type: .system)
        anonyBtn.setTitle("Anonymous", for: .normal)
        anonyBtn |> baseButtonStyle
        return anonyBtn
    }()

    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginBtn,signupBtn,anonymousBtn])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        return stackView
    }()

    public func installConstraints() {
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
                stackView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -8),
                stackView.heightAnchor.constraint(equalToConstant: 150),
                stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant:-10)
                ])
        } else {
            // Fallback on earlier versions
        }
    }

    //MARK: - Overriden functions

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(stackView)
        navigationItem.title = "Splash"
        installConstraints()
        viewAddOns()
    }

    private func viewAddOns() {
        loginBtn.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        signupBtn.addTarget(self, action: #selector(signupPressed), for: .touchUpInside)
        anonymousBtn.addTarget(self, action: #selector(anonymousPressed), for: .touchUpInside)
    }

    @objc private func loginPressed() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }

    @objc private func signupPressed() {
        navigationController?.pushViewController(SignupViewController(), animated: true)
    }

    @objc private func anonymousPressed() {
        let studNC = UINavigationController(
            .students, child: StudentsListController())
        let profNC = UINavigationController(
            .professors,child: ProfessorListController())
        studNC.setupAppThemeBar()
        profNC.setupAppThemeBar()

        let tc = UITabBarController()
        tc.viewControllers = [studNC,profNC]
        (UIApplication.shared.delegate as! AppDelegate).window.rootViewController = tc
    }

}
