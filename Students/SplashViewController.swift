//
//  SplashViewController.swift
//  Students
//
//  Created by Ranjith Kumar on 7/12/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

//Refactored:
//Variable names are declared as NOUN
//Function names are used as Verb

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

    public func setLayoutConstraints() {
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
        setupUI()
        setLayoutConstraints()
        setButtonHookups()
    }
    
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        navigationItem.title = "Splash"
    }

    private func setButtonHookups() {
        loginBtn.addTarget(self, action: #selector(loginBtnTapped), for: .touchUpInside)
        signupBtn.addTarget(self, action: #selector(signupBtnTapped), for: .touchUpInside)
        anonymousBtn.addTarget(self, action: #selector(anonymousBtnTapped), for: .touchUpInside)
    }

    @objc private func loginBtnTapped() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }

    @objc private func signupBtnTapped() {
        navigationController?.pushViewController(SignupViewController(), animated: true)
    }

    @objc private func anonymousBtnTapped() {
        let studNavController = UINavigationController(
            .students, child: StudentsListController()
        )
        let profNavController = UINavigationController(
            .professors,child: ProfessorListController()
        )
        studNavController.setupNavigationBarTheme()
        profNavController.setupNavigationBarTheme()

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [studNavController,profNavController]
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        appDelegate.window.rootViewController = tabBarController
    }

}
