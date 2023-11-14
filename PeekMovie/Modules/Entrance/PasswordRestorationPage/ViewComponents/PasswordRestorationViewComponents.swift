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
    lazy var emailLabel = PeekLabel(type: .main, text: Constants.emailDefaultText, font: .body)
    
    lazy var emailTextField = PeekInputTextField(placeholder: Constants.emailTextFieldPlaceholder)
    lazy var passwordTextField = PeekInputTextField(placeholder: Constants.passwordTextFieldPlaceholder)
    
    lazy var emailIconView = PeekIconView(image: Images.Icon.Email.x24)
    lazy var passwordIconView = PeekIconView(image: Images.Icon.Key.x24)
    
    lazy var mainButton = PeekButton(type: .main, titleText: Constants.getCodeButtonText)
    lazy var secondaryButton = PeekButton(type: .secondary, titleText: Constants.resendCodeButtonText)
    
    lazy var timerLabel = PeekLabel(type: .secondary, text: Constants.timerLabelDefault, font: .caption1)
    
    lazy var verificationCodeView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.backgroundCoverGray
        view.layer.opacity = 0.6
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var captionLabelHeightConstraint: NSLayoutConstraint?
    
    
    func setupViews(parent: UIView) {
        parent.addSubview(draggerView)
        parent.addSubview(captionLabel)
        parent.addSubview(emailIconView)
        parent.addSubview(passwordIconView)
        parent.addSubview(emailTextField)
        parent.addSubview(passwordTextField)
        parent.addSubview(verificationCodeView)
        parent.addSubview(mainButton)
        
        captionLabel.numberOfLines = .zero
        captionLabel.textAlignment = .center
        
        passwordIconView.layer.opacity = .zero
        passwordTextField.layer.opacity = .zero
        
        emailTextField.layer.opacity = .zero
        
        setupConstraints(parent: parent)
    }
    
    
    func setupLayers(parent: UIView) {
        backgroundLinear.frame.size = parent.frame.size
        backgroundLinear.cornerRadius = Constants.paddingM
        backgroundLinear.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        parent.layer.addSublayer(backgroundLinear)
    }
    
}
