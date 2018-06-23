//
//  TxtFieldUtils.swift
//  Students
//
//  Created by Ranjith Kumar on 6/23/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation
import UIKit

precedencegroup SingleTypeComposition {
    associativity: right
}

infix operator <>: SingleTypeComposition

func <> <A: AnyObject>(f: @escaping (A) -> Void, g: @escaping (A) -> Void) -> (A) -> Void {
    return {
        a in
        f(a)
        g(a)
    }
}

/* TextField */

let baseTextFieldStyle: (UITextField) -> Void = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.font = .systemFont(ofSize: 17)
    $0.borderStyle = .roundedRect
}

let emailTextFieldStyle: (UITextField) -> Void =  {
    $0.keyboardType = .emailAddress
    $0.placeholder = "Email"
    $0.autocorrectionType = .no
}

let passwordTextFieldStyle: (UITextField) -> Void = {
    $0.isSecureTextEntry = true
    $0.placeholder = "••••••••••••••••"
    $0.autocorrectionType = .no
}

let setAutocorrectionNo: (UITextField) -> Void = {
    $0.autocorrectionType = .no
}

let nextRetunKeyStyle: (UITextField) -> Void = {
    $0.returnKeyType = .next
}

let doneReturnKeyStyle: (UITextField) -> Void = {
    $0.returnKeyType = .done
}

func nextOnlyToolBar() -> UIToolbar {
    let toolbar = UIToolbar(frame: CGRect(x:0,y:0,width:UIScreen.main.bounds.width,height:50))
    let flexibleSapceBtnItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
    toolbar.items = [flexibleSapceBtnItem]
    return toolbar
}

/* UIButton */
let baseButtonStyle: (UIButton) -> Void = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
    $0.contentEdgeInsets = UIEdgeInsets(top: 12, left: 16, bottom: 12, right: 16)
    $0.layer.cornerRadius = 8
}



