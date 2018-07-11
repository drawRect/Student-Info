//
//  UIView+Extensions.swift
//  Students
//
//  Created by Ranjith Kumar on 7/11/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import UIKit

extension UIView {

    func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        addGestureRecognizer(tapGesture)
    }

    @objc private func dismissKeyboard() {
        endEditing(true)
    }
}
