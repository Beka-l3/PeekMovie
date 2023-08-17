//
//  AuthorizedPageViewModels.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 11.10.2022.
//

import UIKit


final class AuthorizedPageViewComponents: Colors, Fonts, Interactives, Informatives {
    
    lazy var logoImage: UIImageView = {
        let i = UIImageView()
        i.image = EPConstants.logoImage
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    lazy var logOutButton: UIButton = {
        getTeritaryButton(with: EPConstants.logOutButtonTitle)
    }()
    
    lazy var tipLabel: UILabel = {
        let username = UserDefaults.standard.string(forKey: GConstants.usernameKey) ?? "User"
        return getTipLabel(with: EPConstants.joinTipText, detail: username)
    }()
    
    lazy var roomIdInput: UITextField = {
        getInputTextView(with: EPConstants.roomIdIntupPlaceholder)
    }()
    
    lazy var joinButton: UIButton = {
        getFocusButton(with: EPConstants.joinButtonTitle)
    }()
    
    lazy var secondTipLabel: UILabel = {
        getTipLabel(with: EPConstants.orTipText)
    }()
    
    lazy var createButton: UIButton = {
        getSecondaryButton(with: EPConstants.createButtonTitle)
    }()
    
    lazy var joinRoomView: UIView = {
        let v = UIView()
        
        v.addSubview(logOutButton)
        v.addSubview(logoImage)
        v.addSubview(tipLabel)
        v.addSubview(roomIdInput)
        v.addSubview(joinButton)
        v.addSubview(secondTipLabel)
        v.addSubview(createButton)
        
        NSLayoutConstraint.activate([
            logOutButton.topAnchor.constraint(equalTo: v.topAnchor),
            logOutButton.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            
            logoImage.widthAnchor.constraint(equalToConstant: EPConstants.logoSize.width),
            logoImage.heightAnchor.constraint(equalToConstant: EPConstants.logoSize.height),
            logoImage.centerXAnchor.constraint(equalTo: v.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: logOutButton.bottomAnchor, constant: EPConstants.padding),
            
            tipLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: EPConstants.smallPadding),
            tipLabel.centerXAnchor.constraint(equalTo: v.centerXAnchor),
            
            roomIdInput.topAnchor.constraint(equalTo: tipLabel.bottomAnchor, constant: EPConstants.padding),
            roomIdInput.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            roomIdInput.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            roomIdInput.heightAnchor.constraint(equalToConstant: EPConstants.interactiveSize.height),
            
            joinButton.topAnchor.constraint(equalTo: roomIdInput.bottomAnchor, constant: EPConstants.padding),
            joinButton.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            joinButton.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            joinButton.heightAnchor.constraint(equalToConstant: EPConstants.interactiveSize.height),
            
            secondTipLabel.topAnchor.constraint(equalTo: joinButton.bottomAnchor, constant: EPConstants.padding),
            secondTipLabel.centerXAnchor.constraint(equalTo: v.centerXAnchor),
            
            createButton.topAnchor.constraint(equalTo: secondTipLabel.bottomAnchor, constant: EPConstants.padding),
            createButton.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            createButton.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            createButton.heightAnchor.constraint(equalToConstant: EPConstants.interactiveSize.height),
        ])
        
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    func updateViews() {
        let username = UserDefaults.standard.string(forKey: GConstants.usernameKey) ?? "User"
//        print(username)
//        print(UserDefaults.standard.string(forKey: GConstants.usernameKey))
        tipLabel.attributedText = getTipLabel(with: EPConstants.joinTipText, detail: username).attributedText
    }
}
