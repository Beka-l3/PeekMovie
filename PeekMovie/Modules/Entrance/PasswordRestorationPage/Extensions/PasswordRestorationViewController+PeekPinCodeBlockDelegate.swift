//
//  PasswordRestorationViewController+PeekPinCodeBlockDelegate.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 07.12.2023.
//

import UIKit


extension PasswordRestorationViewController: PeekPinCodeBlockDelegate {
    
    func didEnter4Digits() {
        Task {
            
            viewComponents.activityLoaderView.startAnimating()
            
            do {
                
                let verificationCode = viewComponents.pinCodeBlockView.pinCodeText
                try await Service.api.restorePasswordSendVerificationCode(credentials: .init(verificationCode: verificationCode))
                
                viewComponents.stopCountDown()
                changeState(to: .resetPassword)
                
            } catch {
                
                print("Error while _restorePasswordSendVerificationCode()_ from _PasswordRestorationViewController_", error)
                
            }
            
            viewComponents.activityLoaderView.stopAnimating()
            
        }
    }
    
}
