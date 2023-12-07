//
//  PeekPinCodeInputTextField.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 04.12.2023.
//

import UIKit


final class PeekPinCodeInputTextField: UITextField {
    
    
//    MARK: lifecycle
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    

    
//    MARK: private func
    private func setupView() {
        backgroundColor = .clear
        font = .systemFont(ofSize: .zero)
        textColor = .clear
        tintColor = .clear
        keyboardType = .asciiCapableNumberPad
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

