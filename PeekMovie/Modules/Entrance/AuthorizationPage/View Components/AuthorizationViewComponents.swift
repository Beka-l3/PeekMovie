//
//  SignInPageViewComponents.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 22.08.2023.
//

import UIKit


final class AuthorizationViewComponents {
    
    lazy var backgroundLinear = PeekBackgroundGradientGenerator.shared.getGradient(type: .linearBottomLeft)
    lazy var backgroundRadial = PeekBackgroundGradientGenerator.shared.getGradient(type: .raidalBottom)
    
    lazy var appLogoIconView = PeekIconView(image: Images.Logo.App.x90, size: .x90, cornerRadius: Constants.paddingM / 2, withShadow: true)
    
    lazy var usernameTextField = PeekInputTextField(placeholder: Constants.usernameTextFieldPlaceholder)
    lazy var emailTextField = PeekInputTextField(placeholder: Constants.emailTextFieldPlaceholder)
    lazy var passwordTextField = PeekInputTextField(placeholder: Constants.passwordTextFieldPlaceholder)
    
    lazy var usernameIconView = PeekIconView(image: Images.Icon.Profile.x24)
    lazy var emailIconView = PeekIconView(image: Images.Icon.Email.x24)
    lazy var passwordIconView = PeekIconView(image: Images.Icon.Key.x24)
    
    lazy var mainButton = PeekButton(type: .main, titleText: Constants.loginButtonTitleText)
    lazy var secondaryButton = PeekButton(type: .secondary, titleText: Constants.signUpButtonTitleText)
    lazy var tertiaryButton = PeekButton(type: .tertiary, titleText: Constants.forgotPasswordButtonTitleText)
    
    lazy var alternatorLabelLabel = PeekLabel(type: .secondary, text: Constants.signUpLabelText, font: .caption1)
    
    lazy var alternatingHStack = getBottomHStackView(with: [alternatorLabelLabel, secondaryButton])
    
    lazy var backgroundImage = PeekBackgroundImageView(image: Images.Static.EntranceBackground.normal)
    lazy var backgroundImageBW = PeekBackgroundImageView(image: Images.Static.EntranceBackground.unsaturated)
    
    lazy var backgroundImageCover = PeekCoverView()
    
    lazy var inputBlock: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.paddingM
        view.backgroundColor = Colors.backgroundPrimary
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.layer.shadowOffset = Constants.inputBlockShadowOffset
        view.layer.shadowColor = Constants.inputBlockShadowColor
        view.layer.shadowRadius = Constants.inputBlockShadowRadius
        view.layer.shadowOpacity = Constants.inputBlockShadowOpacity
        
        return view
    }()
    
    var passwordIconViewTopConstraint: NSLayoutConstraint?
    var alternatingHStackBottomConstraint: NSLayoutConstraint?
    
    var setMainButtonEnabled: Bool = false
    

//    MARK: exposed func
    func setupViews(parent: UIView) {
        parent.backgroundColor = Colors.backgroundPrimary
        
        parent.addSubview(backgroundImage)
        parent.addSubview(backgroundImageBW)
        parent.addSubview(backgroundImageCover)
        
        parent.addSubview(appLogoIconView)
        parent.addSubview(inputBlock)
        
        inputBlock.addSubview(usernameIconView)
        inputBlock.addSubview(usernameTextField)
        inputBlock.addSubview(emailIconView)
        inputBlock.addSubview(emailTextField)
        inputBlock.addSubview(passwordIconView)
        inputBlock.addSubview(passwordTextField)
        
        inputBlock.addSubview(mainButton)
        inputBlock.addSubview(tertiaryButton)
        inputBlock.addSubview(alternatingHStack)
        
        changeState(to: .signIn, parent: parent, isSetup: true)
        
        setupConstraints(parent: parent)
    }
    
    func setupLayers(parent: UIView) {
        backgroundLinear.frame.size = .init(width: Constants.screenWidth, height: Constants.inputBlockHeight)
        backgroundLinear.cornerRadius = Constants.paddingM
        backgroundLinear.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        inputBlock.layer.addSublayer(backgroundLinear)
    }
    
}

