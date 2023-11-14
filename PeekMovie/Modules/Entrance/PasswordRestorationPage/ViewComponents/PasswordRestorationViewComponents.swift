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
    
    lazy var verificationCodeView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.backgroundCoverGray
        view.layer.opacity = 0.6
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var secondaryButton = PeekButton(type: .secondary, titleText: Constants.resendCodeButtonText)
    lazy var timerLabel = PeekLabel(type: .secondary, text: Constants.timerLabelDefault, font: .caption1)
    lazy var timerHStack = getBottomHStackView(with: [secondaryButton, timerLabel])
    
    
    func setupViews(parent: UIView) {
        parent.addSubview(draggerView)
        parent.addSubview(captionLabel)
        parent.addSubview(emailLabel)
        parent.addSubview(emailIconView)
        parent.addSubview(passwordIconView)
        parent.addSubview(emailTextField)
        parent.addSubview(passwordTextField)
        parent.addSubview(verificationCodeView)
        parent.addSubview(mainButton)
        parent.addSubview(timerHStack)
        
        addAdjustment()
        
        changeState(to: .enterEmail, parent: parent, isSetup: true)
        
        setupConstraints(parent: parent)
    }
    
    
    func setupLayers(parent: UIView) {
        backgroundLinear.frame.size = parent.frame.size
        backgroundLinear.cornerRadius = Constants.paddingM
        backgroundLinear.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        parent.layer.addSublayer(backgroundLinear)
    }
    
    
//    MARK: private func
    private func addAdjustment() {
        captionLabel.numberOfLines = .zero
        captionLabel.textAlignment = .center
        
        emailLabel.textAlignment = .center
    }
}


extension PasswordRestorationViewComponents {
    func getBottomHStackView(with arrangedSubviews: [UIView]) -> UIStackView {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = Constants.paddingXXS
        view.backgroundColor = Colors.clearBlack
        
        for subview in arrangedSubviews {
            view.addArrangedSubview(subview)
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
