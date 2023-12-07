//
//  PasswordRestorationViewComponents+TextField.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 07.12.2023.
//

import UIKit


extension PasswordRestorationViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if textField === viewComponents.emailTextField {
            
        } else if textField === viewComponents.passwordTextField {
            
        }
        
    }
    
}
