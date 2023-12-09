//
//  PeekPinCodeBlock+AddDoneButton.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 07.12.2023.
//

import UIKit


extension PeekPinCodeBlock {
    func addDoneButtonOnKeyboard(){
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(
            x: .zero,
            y: .zero,
            width: UIScreen.main.bounds.width,
            height: Constants.doneButtonToolBarHeight)
        )
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(
            title: Constants.doneButtonText,
            style: .done,
            target: self,
            action: #selector(handleDoneButtonFromKeyboard)
        )

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        inputTextField.inputAccessoryView = doneToolbar
    }
}
