//
//  PasswordRestorationViewComponents+Reset.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 07.12.2023.
//

import UIKit


extension PasswordRestorationViewComponents {
    func reset() {
        
        emailTextField.text = ""
        passwordTextField.text = ""
        
        disableMainButton()
        
    }
}
