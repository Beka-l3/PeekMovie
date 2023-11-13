//
//  EntranceModuleBuilder.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.08.2023.
//

import UIKit

final class EntranceModuleBuilder {
    
    let passwordRestorationPage: PasswordRestorationViewController
    let authorizationPage: AuthorizationViewController
    
    
    init() {
        self.passwordRestorationPage = .init()
        self.authorizationPage = .init(passwordRestorationPage: passwordRestorationPage)
    }
    
    deinit {
        
    }
}
