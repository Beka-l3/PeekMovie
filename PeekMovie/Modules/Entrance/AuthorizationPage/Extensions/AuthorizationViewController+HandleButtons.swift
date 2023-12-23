//
//  SignInPageViewController+HandleButtons.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 09.11.2023.
//

import UIKit


extension AuthorizationViewController {
    
    @objc func handleMainButton() {
        tapped()
        
        switch entranceState {
        
        case .signIn:
            if
                let email = viewComponents.emailTextField.text,
                let password = viewComponents.passwordTextField.text
            {
                
                let credentials = SignInCredentials(email: email, password: password)
                
                viewComponents.activityLoaderView.startAnimating()
                
                Task {
                    do {
                        
                        try await Service.api.signIn(credentials: credentials)
                        appCoordinator?.loggedIn()
                        
                    } catch {
                        
                        print("Sign In Error: \(error)")
                        
                    }
                    
                    viewComponents.activityLoaderView.stopAnimating()
                }
            }
            
        case .signUp:
            if
                let username = viewComponents.usernameTextField.text,
                let email = viewComponents.emailTextField.text,
                let password = viewComponents.passwordTextField.text
            {
                let credentials = SignUpCredentials(username: username, email: email, password: password)
                
                viewComponents.activityLoaderView.startAnimating()
                
                Task {
                    do {
                        
                        try await Service.api.signUp(credentials: credentials)
                        appCoordinator?.loggedIn()
                        
                    } catch {
                        
                        print("Sign In Error: \(error)")
                        
                    }
                    
                    viewComponents.activityLoaderView.stopAnimating()
                }
            }
            
            
        }
    }
    
    @objc func handleSecondaryButton() {
        
        // Change entrnace state
        switch entranceState {
        
        case .signIn:
            changeState(to: .signUp)
            
        case .signUp:
            changeState(to: .signIn)
            
        }
        
    }
    
    @objc func handleTertiaryButton() {
        
        present(passwordRestorationPage, animated: true)
        
    }
    
}

