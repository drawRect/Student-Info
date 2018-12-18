//
//  SignupViewModel.swift
//  Students
//
//  Created by Ranjith Kumar on 6/26/18.
//  Copyright © 2018 DrawRect. All rights reserved.
//

import Foundation

final class SignupViewModel {
    var nameTxt = Box<String>()
    var emailTxt = Box<String>()
    var phoneTxt = Box<String>()
    var passwordTxt = Box<String>()
    var confirmPasswordTxt = Box<String>()
    var isSubmitBtnEnabled = Box<Bool>()
}
