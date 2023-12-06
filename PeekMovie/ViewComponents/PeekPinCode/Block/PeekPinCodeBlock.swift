//
//  PeekPinCodeBlock.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 04.12.2023.
//

import UIKit


/// 4 digit `OPT` pin code input block
final class PeekPinCodeBlock: UIView {
    
    private(set) lazy var digit1: PeekPinCodeDigitLabel = .init(with: 0)
    private(set) lazy var digit2: PeekPinCodeDigitLabel = .init(with: 1)
    private(set) lazy var digit3: PeekPinCodeDigitLabel = .init(with: 2)
    private(set) lazy var digit4: PeekPinCodeDigitLabel = .init(with: 3)
    
    private(set) lazy var inputTextField: PeekPinCodeInputTextField = .init()
    
    private lazy var tapHandlerView: PeekTapHandlerView = .init()
    
    private lazy var digitsStackView: UIStackView = {
        let view = UIStackView()
        
        view.backgroundColor = .clear
        view.distribution = .fillEqually
        view.spacing = Constants.paddingM
        
        view.addArrangedSubview(digit1)
        view.addArrangedSubview(digit2)
        view.addArrangedSubview(digit3)
        view.addArrangedSubview(digit4)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) var pinCodeText: String = ""
    

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
    
    
//    MARK: exposed func
    func removeDigit() {
        pinCodeText.removeLast()
    }
    
    func addDigit(digit: String) {
        pinCodeText += digit
    }
    
    
//    MARK: private func
    private func setupView() {
        addSubview(inputTextField)
        addSubview(digitsStackView)
        addSubview(tapHandlerView)
        
        NSLayoutConstraint.activate([
            inputTextField.topAnchor.constraint(equalTo: topAnchor),
            inputTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            inputTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            inputTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            digitsStackView.topAnchor.constraint(equalTo: topAnchor),
            digitsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            digitsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            digitsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            tapHandlerView.topAnchor.constraint(equalTo: topAnchor),
            tapHandlerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tapHandlerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tapHandlerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        inputTextField.delegate = self
        tapHandlerView.delegate = self
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}


extension PeekPinCodeBlock {
    enum Constants {
        
        static let pinCodeDigitLabelMinWidth: CGFloat = 60
        static let pinCodeDigitLabelMinHeight: CGFloat = 80
        
        static let padding: CGFloat = 12
        static let paddingM: CGFloat = 18
        
        static let maxDigitAmount = 4
        
    }
}


extension PeekPinCodeBlock: PeekTapHandlerViewDelegate {
    func tapped() {
        print("Handle tap")
        inputTextField.becomeFirstResponder()
    }
}
