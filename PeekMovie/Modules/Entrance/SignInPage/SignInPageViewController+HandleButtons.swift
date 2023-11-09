//
//  SignInPageViewController+HandleButtons.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 09.11.2023.
//

import UIKit


extension SignInPageViewController {
    @objc func handleMainButton() {
        
        switch entranceState {
        
        case .signIn:
            break
            
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
        
        viewComponents.changeState(to: entranceState)
    }
    
    @objc func handleTertiaryButton() {
        print("Tertiary button tapped")
        // Forgot password
        
    }
}
