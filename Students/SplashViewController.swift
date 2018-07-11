//
//  SplashViewController.swift
//  Students
//
//  Created by Ranjith Kumar on 7/12/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    private var _view: SplashView{return view as! SplashView}

    //MARK: - Overriden functions
    override func loadView() {
        super.loadView()
        view = SplashView(frame: Constants.Screen.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Splash"
        _view.installConstraints()
        viewAddOns()
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

}
