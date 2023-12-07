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
            break
            
        case .sendVerificationCode:
            break
            
        case .resetPassword:
            break
            
        }
    }
}
