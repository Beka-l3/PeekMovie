//
//  PasswordRestorationViewComponents.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.11.2023.
//

import UIKit


final class PasswordRestorationViewComponents {
    
    
    lazy var backgroundLinear = BackgroundGradient(type: .linearTop)
    
    
    func setupViews(parent: UIView) {
        
        
        
        setupConstraints(parent: parent)
    }
    
    
    func setupLayers(parent: UIView) {
//        backgroundLinear.frame.size = .init(width: Constants.screenWidth, height: Constants.inputBlockHeight)
        backgroundLinear.frame.size = parent.frame.size
        backgroundLinear.cornerRadius = Constants.paddingM
        backgroundLinear.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        parent.layer.addSublayer(backgroundLinear)
    }
    
}


extension PasswordRestorationViewComponents {
    enum Constants {
        
        
        static let paddingXXS: CGFloat = 4
        static let paddingXS: CGFloat = 6
        static let paddingS: CGFloat = 10
        static let padding: CGFloat = 16
        static let paddingM: CGFloat = 24
        static let paddingL: CGFloat = 36
        static let paddingXL: CGFloat = 48
        static let paddingXXL: CGFloat = 52
        static let paddingXXXL: CGFloat = 96
        static let paddingXXXXL: CGFloat = 144
        
        
    }
}
