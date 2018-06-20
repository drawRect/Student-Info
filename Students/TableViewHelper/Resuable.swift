//
//  Resuable.swift
//  Students
//
//  Created by Ranjith Kumar on 6/15/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

//MARK: Protocol
protocol Reusable {}

//MARK: protocol extension constrained to UITableViewCell
extension Reusable where Self: UITableViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

//MARK: elements conforming to Reusable
extension UITableViewCell: Reusable {}

//MARK: extending Collections
extension UITableView {
    
    func register<T: UITableViewCell>(_ :T.Type) {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func registerNib<T: UITableViewCell>(_ :T.Type) {
        let nib = UINib(nibName: T.reuseIdentifier, bundle: nil)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("could not dequeue cell")
        }
        return cell
    }
    
    func dequeueReusableCell<T: UITableViewCell>() -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier) as? T else {
            fatalError("could not dequeue cell")
        }
        return cell
    }
    
}
