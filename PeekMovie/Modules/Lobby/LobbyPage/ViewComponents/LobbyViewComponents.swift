//
//  LobbyViewComponents.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 12.12.2023.
//

import UIKit


final class LobbyViewComponents {
    
    lazy var backgroundLinear = PeekBackgroundGradientGenerator.shared.getGradient(type: .linearBottomLeft)
    
//    lazy var appLogoIconView = PeekIconView(image: Images.Logo.App.x90, size: .x90, cornerRadius: Constants.paddingM / 2, withShadow: true)
    
//    lazy var roomIdTextField = PeekInputTextField(placeholder: Constants.usernameTextFieldPlaceholder)
    lazy var roomIdIconView = PeekIconView(image: Images.Icon.MovieRoom.x24)
    
//    lazy var mainButton = PeekButton(type: .main, titleText: Constants.loginButtonTitleText)
//    lazy var secondaryButton = PeekButton(type: .secondary, titleText: Constants.signUpButtonTitleText)
//    lazy var tertiaryButton = PeekButton(type: .tertiary, titleText: Constants.forgotPasswordButtonTitleText)
    
//    lazy var createRoomLabelLabel = PeekLabel(type: .secondary, text: Constants.signUpLabelText, font: .caption1)
//    lazy var createRoomHStack = getBottomHStackView(with: [alternatorLabelLabel, secondaryButton])
    
    lazy var backgroundImage = PeekBackgroundImageView(image: Images.Static.EntranceBackground.normal)
    
    lazy var backgroundImageCover = PeekCoverView()
    
    lazy var tapHandlerView = PeekTapHandlerView()
    
//    lazy var inputBlock: UIView = {
//        let view = UIView()
//        view.layer.cornerRadius = Constants.paddingM
//        view.backgroundColor = Colors.backgroundPrimary
//        view.translatesAutoresizingMaskIntoConstraints = false
//
//        view.layer.shadowOffset = Constants.inputBlockShadowOffset
//        view.layer.shadowColor = Constants.inputBlockShadowColor
//        view.layer.shadowRadius = Constants.inputBlockShadowRadius
//        view.layer.shadowOpacity = Constants.inputBlockShadowOpacity
//
//        return view
//    }()
    
    
    func setupView(parent: UIView) {
        
        
        
    }
    
    func setupLayers(parent: UIView) {
    
        
        
    }
 
    
    
}
