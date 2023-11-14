//
//  PasswordRestorationViewComponents.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.11.2023.
//

import UIKit


final class PasswordRestorationViewComponents {
    
    lazy var backgroundLinear = PeekBackgroundGradient(type: .linearTop)
    lazy var draggerView = PeekBottomSheetDraggerView()
    
    lazy var captionLabel = PeekLabel(type: .secondary, text: Constants.weSendCodeText, font: .caption1)
    lazy var emailTextField = PeekInputTextField(placeholder: Constants.emailTextFieldPlaceholder)
    
    lazy var emailIconView = PeekIconView(image: Images.Icon.Email.x24)
    
    lazy var mainButton = PeekButton(type: .main, titleText: Constants.getCodeButtonText)
    
    
    var captionLabelHeightConstraint: NSLayoutConstraint?
    
    
    func setupViews(parent: UIView) {
        parent.addSubview(draggerView)
        parent.addSubview(captionLabel)
        parent.addSubview(emailIconView)
        parent.addSubview(emailTextField)
        parent.addSubview(mainButton)
        
        captionLabel.numberOfLines = .zero
        captionLabel.textAlignment = .center
        
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
        static let weSendCodeText = "We will send 4-digit conformation code to your email"
        static let emailTextFieldPlaceholder = "Email"
        static let getCodeButtonText = "GET CODE"
        
        static let paddingXXS: CGFloat = 4
        static let paddingXS: CGFloat = 6
        static let paddingS: CGFloat = 10
        static let padding: CGFloat = 16
        static let paddingM: CGFloat = 24
        static let paddingL: CGFloat = 36
        static let paddingXL: CGFloat = 48
        static let paddingXXL: CGFloat = 64
        static let paddingXXXL: CGFloat = 96
        static let paddingXXXXL: CGFloat = 144
        
        static let inputFieldHeight: CGFloat = 24
        
        
    }
}
