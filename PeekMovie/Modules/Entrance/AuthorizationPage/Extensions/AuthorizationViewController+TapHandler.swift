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
            
        } else if viewComponents.usernameTextField.isFirstResponder {
            
            viewComponents.usernameTextField.resignFirstResponder()
            
        } else if viewComponents.passwordTextField.isFirstResponder {
        
            viewComponents.passwordTextField.resignFirstResponder()
            
        }
        
    }
    
}
