import Foundation
import UIKit

protocol LeftViewMode {
    func setLeftViewMode()
}

extension LeftViewMode where Self: UITextField {
    func setLeftViewMode() {
        self.leftViewMode = .always
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: self.frame.height))
    }
}

extension UITextField: LeftViewMode {}

struct ScreenSize {
    static let width = 375
    static let height = 667
}

public class LoginViewController : UIViewController {
    
    private let userNameField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Email ID"
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.setLeftViewMode()
        if #available(iOS 11, *) {
            tf.textContentType = .username
        }
        return tf
    }()
     private let passwordField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.borderStyle = .roundedRect
        if #available(iOS 11, *) {
            tf.textContentType = .password
        }
        tf.setLeftViewMode()
        return tf
    }()
    private let submitBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Submit", for: .normal)
        btn.layer.cornerRadius = 5.0
        btn.backgroundColor = .orange
        btn.layer.borderWidth = 1.0
        btn.layer.borderColor = UIColor.lightGray.cgColor
        return btn
    }()
    
    public override func viewDidLoad() {
        setUpViewElements()
        setUpConstraints()
        super.viewDidLoad()
    }
    private func setUpViewElements() {
        self.view.frame = CGRect(x: 0, y: 0, width: ScreenSize.width, height: ScreenSize.height)
        self.view.backgroundColor = .red
        self.view.addSubview(userNameField)
        self.view.addSubview(passwordField)
        self.view.addSubview(submitBtn)
        print("Frame: \(self.view.frame)")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            self.userNameField.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 20),
            self.userNameField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
            self.userNameField.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 20),
            self.userNameField.bottomAnchor.constraint(equalTo: self.passwordField.topAnchor, constant: 8)
            ])
        NSLayoutConstraint.activate([
            self.passwordField.leftAnchor.constraint(equalTo: self.userNameField.leftAnchor),
            self.passwordField.rightAnchor.constraint(equalTo: self.userNameField.rightAnchor),
            self.passwordField.topAnchor.constraint(equalTo: self.userNameField.bottomAnchor, constant: 8),
            self.passwordField.bottomAnchor.constraint(equalTo: self.submitBtn.bottomAnchor, constant: 20)
            ])
        NSLayoutConstraint.activate([
            self.submitBtn.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 40),
            self.submitBtn.topAnchor.constraint(equalTo: self.passwordField.bottomAnchor, constant: 20),
            self.submitBtn.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 40),
            self.submitBtn.bottomAnchor.constraint(greaterThanOrEqualTo: self.view.bottomAnchor, constant: 20)
            ])
    }
}
