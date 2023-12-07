//
//  PeekPinCodeBlock+TextField.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 05.12.2023.
//

import UIKit


extension PeekPinCodeBlock: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        if let text = textField.text {

            if text.count < pinCodeText.count {

                removeDigit()
                
            } else {

                addDigit()
                
                if text.count == Constants.maxDigitAmount {
                    didEnter4Digits()
                }
            }
        }
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let existingText = textField.text ?? ""
        let isNotAtLimit = existingText.count + string.count <= Constants.maxDigitAmount
        
        return isNotAtLimit
    }
    
}
