//
//  PeekPinCodeBlock+FirstResponderController.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 07.12.2023.
//

import UIKit


extension PeekPinCodeBlock: PeekTapHandlerViewDelegate {
    func tapped() {
        print("PeekPinCodeBlock: Handle tap from tap handler view")
        inputTextField.becomeFirstResponder()
    }
}

extension PeekPinCodeBlock {
    @objc func handleDoneButtonFromKeyboard() {
        inputTextField.resignFirstResponder()
    }
}

extension PeekPinCodeBlock {
    func didEnter4Digits() {
        inputTextField.resignFirstResponder()
        delegate?.didEnter4Digits()
    }
}
