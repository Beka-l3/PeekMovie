//
//  SignInPageViewController+HandleButtons.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 09.11.2023.
//

import UIKit


extension SignInPageViewController {
    @objc func handleMainButton() {
        print("Main button tapped")
        
        switch entranceState {
        
        case .signIn:
            break
            
        case .signUp:
            break
            
        }
    }
    
    @objc func handleSecondaryButton() {
        print("Secondary button tapped")
        
        switch entranceState {
        
        case .signIn:
            viewComponents.changeState(to: .signUp)
            entranceState = .signUp
            
        case .signUp:
            viewComponents.changeState(to: .signIn)
            entranceState = .signIn
            
        }
    }
    
    @objc func handleTertiaryButton() {
        print("Tertiary button tapped")
        
    }
}
