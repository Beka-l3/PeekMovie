//
//  MainButton.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 05.11.2023.
//

import UIKit


final class PeekButton: UIButton {
    
    enum ButtonType {
        case main
        case secondary
        case tertiary
    }
    
//    MARK: lifecycle
    init(type: ButtonType, titleText: String) {
        super.init(frame: .zero)
        
        setupView(type: type, titleText: titleText)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    convenience init(type: ButtonType, titleText: String, target: Any?, action: Selector) {
        self.init(type: type, titleText: titleText)
        
        addTarget(target, action: action, for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
//    MARK: private func
    private func setupView(type: ButtonType, titleText: String) {
        backgroundColor = Colors.clearBlack
        setTitle(titleText, for: .normal)
        
        switch type {
        case .main:
            if let first = Colors.mainGradientFirst, let second = Colors.mainGradientSecondary {
                
            } else {
                setTitleColor(Colors.mainGradientFirst, for: .normal)
                titleLabel?.font = Fonts.bold18
            }
        
        case .secondary:
            if let attributeString = getAttributeString(titleText: titleText, font: Fonts.bold14, color: Colors.mainGradientFirst) {
                setAttributedTitle(attributeString, for: .normal)
            }
        
        case .tertiary:
            if let attributeString = getAttributeString(titleText: titleText, font: Fonts.regular12, color: Colors.textTertiary) {
                setAttributedTitle(attributeString, for: .normal)
            }
        }
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}


extension PeekButton {
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
