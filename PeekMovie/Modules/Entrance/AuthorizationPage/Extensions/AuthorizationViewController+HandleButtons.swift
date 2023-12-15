//
//  SignInPageViewController+HandleButtons.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 09.11.2023.
//

import UIKit


extension AuthorizationViewController {
    
    @objc func handleMainButton() {
        
        switch entranceState {
        
        case .signIn:
            if
                let email = viewComponents.emailTextField.text,
                let password = viewComponents.passwordTextField.text
            {
                let signInCredentials = SignInCredentials(email: email, password: password)
                
                Task {
                    do {
                        
                        try await Service.api.signIn(credentials: signInCredentials)
                        appCoordinator?.loggedIn()
                        
                    } catch {
                        
                        print("Sign In Error: \(error)")
                        
                    }
                }
            }
            
        case .signUp:
            break
            
        }
    }
    
    @objc func handleSecondaryButton() {
        
        // Change entrnace state
        switch entranceState {
        
        case .signIn:
            entranceState = .signUp
            
        case .signUp:
            entranceState = .signIn
            
        }
        
        viewComponents.changeState(to: entranceState, parent: view)
    }
    
    @objc func handleTertiaryButton() {
        
        present(passwordRestorationPage, animated: true)
        
    }
    
}
