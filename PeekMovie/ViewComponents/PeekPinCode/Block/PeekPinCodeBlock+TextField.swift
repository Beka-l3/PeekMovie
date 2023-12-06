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
        
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("Did change")
        
        if let text = textField.text {

            if text.isEmpty {

                removeDigit()
                
            } else {

                addDigit(digit: text)
            }
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingText = textField.text ?? ""
        let isNotAtLimit = existingText.count + string.count <= Constants.maxDigitAmount
        
        return isNotAtLimit
    }
    
}
