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
            guard textField === viewComponents.emailTextField, let emailAddressString = viewComponents.emailTextField.text else {
                break
            }
            
            viewComponents.checkGetCodeStateComponents(withValidation: isValidEmailAddress(emailAddressString: emailAddressString))
            
        case .sendVerificationCode:
            break
            
        case .resetPassword:
            break
            
        }
        
    }
    
}
