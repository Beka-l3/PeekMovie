//
//  LobbyViewComponents.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 12.12.2023.
//

import UIKit


final class LobbyViewComponents {
    
    lazy var backgroundLinear = PeekBackgroundGradientGenerator.shared.getGradient(type: .linearBottomLeft)
    
    lazy var appLogoIconView = PeekIconView(image: Images.Logo.App.x90, size: .x90, cornerRadius: Constants.paddingM / 2, withShadow: true)
    
    lazy var usernameIconView = PeekIconView(image: Images.Icon.Profile.x24)
    lazy var usernameLabel = PeekLabel(type: .main, text: Constants.usernameLabelTextDefault, font: .body)
    
    lazy var roomIdTextField = PeekInputTextField(placeholder: Constants.roomidTextFieldPlaceholder)
    lazy var roomIdIconView = PeekIconView(image: Images.Icon.MovieRoom.x24)
    
    lazy var mainButton = PeekButton(type: .main, titleText: Constants.joinButtonTitleText)
    lazy var secondaryButton = PeekButton(type: .secondary, titleText: Constants.createButtonTitleText)
    lazy var tertiaryButton = PeekButton(type: .tertiary, titleText: Constants.logOutButtonTitleText)
    
    lazy var createRoomLabel = PeekLabel(type: .secondary, text: Constants.createRoomLabelText, font: .caption1)
    lazy var createRoomHStack = getBottomHStackView(with: [createRoomLabel, secondaryButton])
    
    lazy var backgroundImage = PeekBackgroundImageView(image: Images.Static.EntranceBackground.normal)
    
    lazy var backgroundImageCover = PeekCoverView()
    
    lazy var tapHandlerView = PeekTapHandlerView()
    
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
    
    
    
    
    func setupView(parent: UIView) {
        parent.backgroundColor = Colors.backgroundPrimary
        
        parent.addSubview(backgroundImage)
        parent.addSubview(backgroundImageCover)
        
        parent.addSubview(appLogoIconView)
        parent.addSubview(inputBlock)
        
        inputBlock.addSubview(usernameIconView)
        inputBlock.addSubview(usernameLabel)
        
        inputBlock.addSubview(roomIdIconView)
        inputBlock.addSubview(roomIdTextField)
        
        inputBlock.addSubview(mainButton)
        inputBlock.addSubview(tertiaryButton)
        
        inputBlock.addSubview(createRoomHStack)
        
        setupConstraints(parent: parent)
    }
    
    func setupLayers(parent: UIView) {
        backgroundLinear.frame.size = .init(width: Constants.screenWidth, height: Constants.inputBlockHeight)
        backgroundLinear.cornerRadius = Constants.paddingM
        backgroundLinear.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        inputBlock.layer.addSublayer(backgroundLinear)
    }
 
    
    
}


extension LobbyViewComponents {
    
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
