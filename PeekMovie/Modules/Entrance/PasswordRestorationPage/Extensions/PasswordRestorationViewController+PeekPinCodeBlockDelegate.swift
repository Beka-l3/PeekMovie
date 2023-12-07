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
            
            do {
                try await Task.sleep(nanoseconds: 1_000_000_000)
            } catch {
                print("oops task sleep failed")
            }
            
            changeState()
        }
    }
    
    @MainActor private func changeState() {
        viewComponents.changeState(to: .resetPassword, parent: view)
        passwordRestorationState = .resetPassword
    }
}
