//
//  PasswordRestorationViewController+HandleButtons.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.11.2023.
//

import UIKit


extension PasswordRestorationViewController {
    
    @objc func handleMainButton() {
        
        switch passwordRestorationState {
            
        case .enterEmail:
            guard let emailString = viewComponents.emailTextField.text else {
                return
            }
            
            Task {
                
                viewComponents.activityLoaderView.startAnimating()
                
                do {
                    
                    try await Service.api.restorePasswordByEmail(credentials: .init(email: emailString))
                    
                    changeState(to: .sendVerificationCode)
                    viewComponents.emailTextField.resignFirstResponder()
                    
                } catch {
                    
                    print("Error while _restorePasswordByEmail()_ from _PasswordRestorationViewController_", error)
                    
                }
                
                viewComponents.activityLoaderView.stopAnimating()
            }
            
        case .sendVerificationCode:
            break
            
        case .resetPassword:
            
            guard let newPasswordString = viewComponents.passwordTextField.text else {
                return
            }
            
            Task {
                
                viewComponents.activityLoaderView.startAnimating()
                
                do {
                    
                    try await Service.api.restorePassword(credentials: .init(newPassword: newPasswordString))
                    
                    dismiss(animated: true)
                    viewComponents.passwordTextField.resignFirstResponder()
                    
                } catch {
                    
                    print("Error while _restorePassword()_ from _PasswordRestorationViewController_", error)
                    
                }
                
                viewComponents.activityLoaderView.stopAnimating()
                
            }
            
        }
        
    }
    
    @objc func handleSecondaryButton() {
        
        switch passwordRestorationState {
        
        case .enterEmail:
            break
            
        case .sendVerificationCode:
            viewComponents.pinCodeBlockView.clearAll()
            viewComponents.startCountDown()
        
        case .resetPassword:
            break
            
        }
        
    }
    
}
