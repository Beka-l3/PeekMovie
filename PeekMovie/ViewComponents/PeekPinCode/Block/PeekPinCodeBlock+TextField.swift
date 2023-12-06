//
//  PeekPinCodeBlock+TextField.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 05.12.2023.
//

import UIKit


extension PeekPinCodeBlock: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Did begin")
        
        chooseFirstResponder()
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("Did change")
        
        if let text = textField.text, let textField = textField as? PeekPinCodeInputTextField {

            if text.isEmpty {

                removeDigit()
//                textField.empty()

            } else {

                addDigit(digit: text)
//                textField.filled()
            }
        }
        
        textField.resignFirstResponder()
        chooseFirstResponder()
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingText = textField.text ?? ""
        let isNotAtLimit = existingText.count + string.count <= 1
        
        print(existingText, string)
        
        if !isNotAtLimit {
            
        }
        
        return isNotAtLimit
    }
    
    
    private func chooseFirstResponder() {
        
        switch pinCodeText.count {
            
        case 0:
            digit1.becomeFirstResponder()
            
        case 1:
            digit2.becomeFirstResponder()
            
        case 2:
            digit3.becomeFirstResponder()
            
        default:
            digit4.becomeFirstResponder()
            
        }
        
    }
}
