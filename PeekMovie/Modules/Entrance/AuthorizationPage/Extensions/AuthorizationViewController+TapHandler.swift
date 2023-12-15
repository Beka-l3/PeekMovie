//
//  AuthorizationViewController+TapHandler.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 15.12.2023.
//

import UIKit


extension AuthorizationViewController: PeekTapHandlerViewDelegate {
    
    func tapped() {
        
        if viewComponents.emailTextField.isFirstResponder {
            
            viewComponents.emailTextField.resignFirstResponder()
            viewComponents.isTextFieldFirstResponder(false, parent: view)
            
        } else if viewComponents.usernameTextField.isFirstResponder {
            
            viewComponents.usernameTextField.resignFirstResponder()
            viewComponents.isTextFieldFirstResponder(false, parent: view)
            
        } else if viewComponents.passwordTextField.isFirstResponder {
        
            viewComponents.passwordTextField.resignFirstResponder()
            viewComponents.isTextFieldFirstResponder(false, parent: view)
            
        }
        
    }
    
}
