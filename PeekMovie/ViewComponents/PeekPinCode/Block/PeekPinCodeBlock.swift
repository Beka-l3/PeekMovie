//
//  PeekPinCodeBlock.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 04.12.2023.
//

import UIKit


/// 4 digit `OPT` pin code input block
final class PeekPinCodeBlock: UIView {
    
    private(set) lazy var digit1: PeekPinCodeInputTextField = .init()
    private(set) lazy var digit2: PeekPinCodeInputTextField = .init()
    private(set) lazy var digit3: PeekPinCodeInputTextField = .init()
    private(set) lazy var digit4: PeekPinCodeInputTextField = .init()
    
    private lazy var digitsStackView: UIStackView = {
        let view = UIStackView()
        view.addArrangedSubview(digit1)
        view.addArrangedSubview(digit2)
        view.addArrangedSubview(digit3)
        view.addArrangedSubview(digit4)
        view.backgroundColor = .clear
        
        view.distribution = .equalCentering
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private(set) var pinCodeText: String = ""
    
    
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
        addSubview(digitsStackView)
        
        NSLayoutConstraint.activate([
            digitsStackView.topAnchor.constraint(equalTo: topAnchor),
            digitsStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            digitsStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            digitsStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            digit1.widthAnchor.constraint(equalToConstant: Constants.pinCodeTextFieldMinWidth),
            digit1.heightAnchor.constraint(equalToConstant: Constants.pinCodeTextFieldMinHeight),
            
            digit2.widthAnchor.constraint(equalToConstant: Constants.pinCodeTextFieldMinWidth),
            digit2.heightAnchor.constraint(equalToConstant: Constants.pinCodeTextFieldMinHeight),
            
            digit3.widthAnchor.constraint(equalToConstant: Constants.pinCodeTextFieldMinWidth),
            digit3.heightAnchor.constraint(equalToConstant: Constants.pinCodeTextFieldMinHeight),
            
            digit4.widthAnchor.constraint(equalToConstant: Constants.pinCodeTextFieldMinWidth),
            digit4.heightAnchor.constraint(equalToConstant: Constants.pinCodeTextFieldMinHeight),
        ])
        
        digit1.delegate = self
        digit2.delegate = self
        digit3.delegate = self
        digit4.delegate = self
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}


extension PeekPinCodeBlock {
    enum Constants {
        
        static let pinCodeTextFieldMinWidth: CGFloat = 60
        static let pinCodeTextFieldMinHeight: CGFloat = 80
        
        static let padding: CGFloat = 12
        
    }
}
