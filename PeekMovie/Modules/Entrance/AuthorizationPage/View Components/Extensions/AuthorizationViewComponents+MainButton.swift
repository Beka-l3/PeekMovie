//
//  AuthorizationViewComponents+MainButton.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 15.12.2023.
//

import Foundation


extension AuthorizationViewComponents {
    
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
