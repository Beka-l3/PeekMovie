//
//  PasswordRestorationViewController+HandleTap.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 06.12.2023.
//

import UIKit


extension PasswordRestorationViewController: PeekTapHandlerViewDelegate {
    func tapped() {
        switch passwordRestorationState {
            
        case .enterEmail:
            if viewComponents.emailTextField.isFirstResponder {
                viewComponents.emailTextField.resignFirstResponder()
            }
            
        case .sendVerificationCode:
            if viewComponents.pinCodeBlockView.inputTextField.isFirstResponder {
                viewComponents.pinCodeBlockView.inputTextField.resignFirstResponder()
            }
            
        case .resetPassword:
            if viewComponents.passwordTextField.isFirstResponder {
                viewComponents.passwordTextField.resignFirstResponder()
            }
            
        }
    }
}
