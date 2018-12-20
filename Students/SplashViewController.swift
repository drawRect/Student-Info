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
        navigationItem.title = "Splash"
        _view.installConstraints()
        viewAddOns()
    }

    private func viewAddOns() {
        _view.loginBtn.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        _view.signupBtn.addTarget(self, action: #selector(signupPressed), for: .touchUpInside)
        _view.anonymousBtn.addTarget(self, action: #selector(anonymousPressed), for: .touchUpInside)
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
        tc.viewControllers = [profNC,studNC]

        (UIApplication.shared.delegate as! AppDelegate).window.rootViewController = tc
    }

}

extension UINavigationController {
    func setupAppThemeBar() {
        if #available(iOS 11.0, *) {
            navigationBar.prefersLargeTitles = true
            navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        } else {
            // Fallback on earlier versions
        }
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationBar.isTranslucent = false
        navigationBar.barTintColor = UIColor.rgb(r: 50, g: 199, b: 242)
        navigationBar.tintColor = UIColor.white
    }
}
