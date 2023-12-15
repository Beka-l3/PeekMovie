//
//  AuthorizationViewController+ChangeState.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 15.12.2023.
//

import Foundation


extension AuthorizationViewController {
    
    func changeState(to state: State) {
        
        entranceState = state
        viewComponents.changeState(to: state, parent: view)
        
        
        switch state {
            
        case .signIn:
            break
            
        case .signUp:
            break
            
        }
    }
    
}
