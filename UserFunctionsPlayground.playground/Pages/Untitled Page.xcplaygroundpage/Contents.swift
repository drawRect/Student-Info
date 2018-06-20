//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

//PlaygroundPage.current.needsIndefiniteExecution = true


class MyViewController: UIViewController {
    override func loadView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        view.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 0, y: 30, width: 300, height: 30))
        label.text = "Success"
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
//let navController = UINavigationController()
//navController.viewControllers = [LoginViewController()]
//PlaygroundPage.current.liveView = navController

PlaygroundPage.current.liveView = MyViewController()
