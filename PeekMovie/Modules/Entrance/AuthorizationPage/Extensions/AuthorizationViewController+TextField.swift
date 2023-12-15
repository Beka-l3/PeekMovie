//
//  AuthorizationViewController+TextField.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 15.12.2023.
//

import UIKit


extension AuthorizationViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        viewComponents.isTextFieldFirstResponder(true, parent: view)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        checkMainButtonAppearance()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField === viewComponents.emailTextField {
            
            switch entranceState {
                
            case .signIn:
                viewComponents.passwordTextField.becomeFirstResponder()
                
            case .signUp:
                viewComponents.usernameTextField.becomeFirstResponder()
                
            }
            
        } else if textField === viewComponents.usernameTextField {
            
            viewComponents.passwordTextField.becomeFirstResponder()
            
        } else if textField === viewComponents.passwordTextField {
            
            textField.resignFirstResponder()
            viewComponents.isTextFieldFirstResponder(false, parent: view)
            
        }
        
        return false
    }
    
}
