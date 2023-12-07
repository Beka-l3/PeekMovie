//
//  PasswordRestorationViewController+HandleTap.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 06.12.2023.
//

import UIKit


extension PasswordRestorationViewController: PeekTapHandlerViewDelegate {
    func tapped() {
        print("Hola")
        
        switch passwordRestorationState {
            
        case .enterEmail:
            break
            
        case .sendVerificationCode:
            print("Hola b")
            viewComponents.pinCodeBlockView.inputTextField.resignFirstResponder()
            break
            
        case .resetPassword:
            break
            
        }
    }
}
