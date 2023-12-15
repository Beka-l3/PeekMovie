//
//  AuthorizationViewController+TextField.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 15.12.2023.
//

import UIKit


extension AuthorizationViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        checkMainButtonAppearance()
        
    }
    
}
