//
//  PasswordRestorationViewController+GetCode.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 07.12.2023.
//

import UIKit


extension PasswordRestorationViewComponents {
    
    var isMainButtonEnabled: Bool {
        get {
            mainButton.isEnabled
        }
    }
    
    
    func enableMainButton() {
        mainButton.isEnabled = true
    }
    
    func disableMainButton() {
        mainButton.isEnabled = false
    }
    
}
