//
//  PasswordRestorationViewComponents+TextField.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 07.12.2023.
//

import UIKit


extension PasswordRestorationViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        switch passwordRestorationState {
            
        case .enterEmail:
            guard textField === viewComponents.emailTextField, let emailAddressString = textField.text else {
                break
            }
            
            viewComponents.checkGetCodeStateComponents(withValidation: isValidEmailAddress(emailAddressString: emailAddressString))
            
        case .sendVerificationCode:
            break
            
        case .resetPassword:
            guard textField === viewComponents.passwordTextField, let newPasswordString = textField.text else {
                break
            }
            
            viewComponents.checkResetPasswordStateComponents(withValidation: isValidPassword(password: newPasswordString))
            
        }
        
    }
    
}
