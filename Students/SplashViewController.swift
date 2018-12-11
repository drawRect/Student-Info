//
//  SplashViewController.swift
//  Students
//
//  Created by Ranjith Kumar on 7/12/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    private lazy var _view = view as! SplashView

    //MARK: - Overriden functions
    override func loadView() {
        super.loadView()
        view = SplashView(frame: Constants.Screen.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        _view.installConstraints()
        viewAddOns()
        setupNavBar()
    }

    private func viewAddOns() {
        _view.loginBtn.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        _view.signupBtn.addTarget(self, action: #selector(signupPressed), for: .touchUpInside)
    }

    @objc private func loginPressed() {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }

    @objc private func signupPressed() {
        navigationController?.pushViewController(SignupViewController(), animated: true)
    }

    fileprivate func setupNavBar() {
        navigationItem.title = "Splash"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
            navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        } else {
            // Fallback on earlier versions
        }
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationController?.navigationBar.tintColor = UIColor.white
    }

}
