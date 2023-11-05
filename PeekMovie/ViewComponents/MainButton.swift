//
//  MainButton.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 05.11.2023.
//

import UIKit


final class MainButton: UIButton {
    
    enum ButtonType {
        case main
        case secondary
        case tertiary
    }
    
//    MARK: lifecycle
    init(type: ButtonType, titleText: String, target: Any?, action: Selector) {
        super.init(frame: .zero)
        
        setupView(type: type, titleText: titleText, target: target, action: action)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
//    MARK: private func
    private func setupView(type: ButtonType, titleText: String, target: Any?, action: Selector) {
        backgroundColor = Colors.clearBlack
        setTitle(titleText, for: .normal)
        
        switch type {
        case .main:
            setTitleColor(Colors.focus, for: .normal)
            titleLabel?.font = Fonts.bold18
        
        case .secondary:
            if let attributeString = getAttributeString(titleText: titleText, font: Fonts.bold14, color: Colors.focus) {
                setAttributedTitle(attributeString, for: .normal)
            }
        
        case .tertiary:
            if let attributeString = getAttributeString(titleText: titleText, font: Fonts.regular12, color: Colors.textTertiary) {
                setAttributedTitle(attributeString, for: .normal)
            }
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        addTarget(target, action: action, for: .touchUpInside)
    }
}


extension MainButton {
    private func getTitleAttributes(font: UIFont?, color: UIColor?) -> [NSAttributedString.Key: Any]? {
        guard let font = font, let color = color else {
            return nil
        }
        
        return [
            .font: font,
            .foregroundColor: color,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
    }
    
    private func getAttributeString(titleText: String, font: UIFont?, color: UIColor?) -> NSMutableAttributedString? {
        guard let titleAttributes = getTitleAttributes(font: font, color: color) else {
            return nil
        }
        
        return NSMutableAttributedString(
            string: titleText,
            attributes: titleAttributes
        )
    }
}
