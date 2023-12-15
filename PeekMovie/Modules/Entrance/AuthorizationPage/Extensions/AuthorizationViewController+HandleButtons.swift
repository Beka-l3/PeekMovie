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
                let credentials = SignInCredentials(email: email, password: password)
                
                Task {
                    do {
                        
                        try await Service.api.signIn(credentials: credentials)
                        appCoordinator?.loggedIn()
                        
                    } catch {
                        
                        print("Sign In Error: \(error)")
                        
                    }
                }
            }
            
        case .signUp:
            if
                let username = viewComponents.usernameTextField.text,
                let email = viewComponents.emailTextField.text,
                let password = viewComponents.passwordTextField.text
            {
                let credentials = SignUpCredentials(username: username, email: email, password: password)
                
                Task {
                    do {
                        
                        try await Service.api.signUp(credentials: credentials)
                        appCoordinator?.loggedIn()
                        
                    } catch {
                        
                        print("Sign In Error: \(error)")
                        
                    }
                }
            }
            
            
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
