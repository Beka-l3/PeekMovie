//
//  SignInPageViewComponents.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 22.08.2023.
//

import UIKit


final class SignInPageViewComponents {
    
    lazy var backgroundLinear = BackgroundGradient(type: .linearBottomLeft)
    lazy var backgroundRadial = BackgroundGradient(type: .raidalBottom)
    
    lazy var appLogoIconView = PeekIconView(image: Images.Logo.App.x90, size: .x90, cornerRadius: Constants.paddingM / 2)
    
    lazy var usernameTextField = UserInputTextField(placeholder: Constants.usernameTextFieldPlaceholder)
    lazy var emailTextField = UserInputTextField(placeholder: Constants.emailTextFieldPlaceholder)
    lazy var passwordTextField = UserInputTextField(placeholder: Constants.passwordTextFieldPlaceholder)
    
    lazy var usernameIconView = PeekIconView(image: Images.Icon.Profile.x24)
    lazy var emailIconView = PeekIconView(image: Images.Icon.Email.x24)
    lazy var passwordIconView = PeekIconView(image: Images.Icon.Key.x24)
    
    lazy var mainButton = PeekButton(type: .main, titleText: Constants.loginButtonTitleText)
    lazy var secondaryButton = PeekButton(type: .secondary, titleText: Constants.signUpButtonTitleText)
    lazy var tertiaryButton = PeekButton(type: .tertiary, titleText: Constants.forgotPasswordButtonTitleText)
    
    lazy var alternatorLabelLabel = PeekLabel(type: .secondary, text: Constants.signUpLabelText, font: .caption1)
    
    lazy var signUpHStack = getBottomHStackView(with: [alternatorLabelLabel, secondaryButton])
    
    lazy var inputBlock: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.paddingM
        view.backgroundColor = Colors.backgroundPrimary
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var passwordIconViewTopConstraint: NSLayoutConstraint?
    

//    MARK: exposed func
    func setupViews(parent: UIView) {
        parent.backgroundColor = Colors.backgroundTertiary
        
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
        inputBlock.addSubview(signUpHStack)
        
        changeState(to: .signIn, isSetup: true)
        
        setupConstraints(parent: parent)
    }
    
    func setupLayers(parent: UIView) {
        backgroundLinear.frame.size = .init(width: Constants.screenWidth, height: Constants.inputBlockHeight)
        backgroundLinear.cornerRadius = Constants.paddingM
        backgroundLinear.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        inputBlock.layer.addSublayer(backgroundLinear)
    }
    
}

