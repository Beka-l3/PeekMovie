//
//  PasswordRestorationViewController+ChangeState.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 11.12.2023.
//

import UIKit


extension PasswordRestorationViewController {
    
    func changeState(to state: PasswordRestorationViewController.State) {
        
        passwordRestorationState = state
        viewComponents.changeState(to: state, parent: view)
        
    }
    
}
