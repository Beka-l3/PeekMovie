//
//  PeekLabel.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 06.11.2023.
//

import UIKit


final class PeekLabel: UILabel {
    
    enum LabelType {
        case main
        case secondary
        case tertiary
        case focus
    }
    
    enum LabelFont {
        case largeTitle, title1, title2, title3
        case headline
        case body, callout, subhead
        case footnote, caption1, caption2
    }
    
    
//    MARK: lifecycle
    init(type: LabelType, text: String, font: LabelFont) {
        super.init(frame: .zero)
        
        setupView(type: type, text: text, font: font)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
//    MARK: private func
    func setupView(type: LabelType, text: String, font: LabelFont) {
        self.text = text
        
        switch type {
            
        case .main:
            textColor = Colors.textMain
        
        case .secondary:
            textColor = Colors.textSecondary
        
        case .tertiary:
            textColor = Colors.textTertiary
            
        case .focus:
            textColor = Colors.focus
        }
        
        switch font {
        
        case .largeTitle:
            self.font = Fonts.regular34
            
        case .title1:
            self.font = Fonts.regular28
            
        case .title2:
            self.font = Fonts.regular22
            
        case .title3:
            self.font = Fonts.regular20
            
        case .headline:
            self.font = Fonts.semiBold17
            
        case .body:
            self.font = Fonts.regular17
            
        case .callout:
            self.font = Fonts.regular16
            
        case .subhead:
            self.font = Fonts.regular15
            
        case .footnote:
            self.font = Fonts.regular13
        
        case .caption1:
            self.font = Fonts.regular12
            
        case .caption2:
            self.font = Fonts.regular11
        }
        
        
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
