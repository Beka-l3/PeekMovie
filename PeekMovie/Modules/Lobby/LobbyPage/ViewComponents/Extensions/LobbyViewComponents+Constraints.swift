//
//  LobbyViewComponents+Constraints.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 12.12.2023.
//

import UIKit


extension LobbyViewComponents {
    
    func setupConstraints(parent: UIView) {
        NSLayoutConstraint.activate([
            appLogoIconView.centerXAnchor.constraint(equalTo: parent.centerXAnchor),
            appLogoIconView.topAnchor.constraint(equalTo: parent.topAnchor, constant: Constants.paddingXL),
            appLogoIconView.widthAnchor.constraint(equalToConstant: appLogoIconView.iconSize.rawValue),
            appLogoIconView.heightAnchor.constraint(equalToConstant: appLogoIconView.iconSize.rawValue),
            
            backgroundImage.topAnchor.constraint(equalTo: parent.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: parent.centerYAnchor),
            
            backgroundImageCover.topAnchor.constraint(equalTo: backgroundImage.topAnchor),
            backgroundImageCover.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor),
            backgroundImageCover.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor),
            backgroundImageCover.bottomAnchor.constraint(equalTo: backgroundImage.bottomAnchor),
            
            inputBlock.topAnchor.constraint(equalTo: appLogoIconView.bottomAnchor, constant: Constants.paddingXL),
            inputBlock.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            inputBlock.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            inputBlock.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            
            usernameIconView.topAnchor.constraint(equalTo: inputBlock.topAnchor, constant: Constants.paddingL),
            usernameIconView.leadingAnchor.constraint(equalTo: inputBlock.leadingAnchor, constant: Constants.paddingXL),
            usernameIconView.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            usernameLabel.leadingAnchor.constraint(equalTo: roomIdIconView.trailingAnchor, constant: Constants.paddingXL),
            usernameLabel.bottomAnchor.constraint(equalTo: usernameIconView.bottomAnchor),
            
            tertiaryButton.trailingAnchor.constraint(equalTo: inputBlock.trailingAnchor, constant: -Constants.paddingL),
            tertiaryButton.bottomAnchor.constraint(equalTo: usernameLabel.bottomAnchor),
            
            roomIdIconView.topAnchor.constraint(equalTo: usernameIconView.bottomAnchor, constant: Constants.paddingXXXL),
            roomIdIconView.leadingAnchor.constraint(equalTo: inputBlock.leadingAnchor, constant: Constants.paddingXL),
            roomIdIconView.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            roomIdTextField.topAnchor.constraint(equalTo: roomIdIconView.topAnchor),
            roomIdTextField.leadingAnchor.constraint(equalTo: roomIdIconView.trailingAnchor, constant: Constants.paddingXL),
            roomIdTextField.trailingAnchor.constraint(equalTo: inputBlock.trailingAnchor),
            roomIdTextField.heightAnchor.constraint(equalToConstant: Constants.inputFieldHeight),
            
            mainButton.topAnchor.constraint(equalTo: roomIdTextField.bottomAnchor, constant: Constants.paddingXL),
            mainButton.leadingAnchor.constraint(equalTo: roomIdTextField.leadingAnchor),
            mainButton.widthAnchor.constraint(equalToConstant:  Constants.mainButtonMaxWidth),
            mainButton.heightAnchor.constraint(equalToConstant:  Constants.mainButtonMaxHeight),
            
            createRoomHStack.centerXAnchor.constraint(equalTo: inputBlock.centerXAnchor),
            createRoomHStack.bottomAnchor.constraint(equalTo: inputBlock.bottomAnchor, constant: -Constants.paddingL),
        ])
    }
    
}
