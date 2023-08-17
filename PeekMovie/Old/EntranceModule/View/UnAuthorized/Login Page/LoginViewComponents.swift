//
//  UnAuthorizedPageViewModels.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.10.2022.
//

import UIKit


final class LoginViewComponents: Colors, Fonts, Interactives, Informatives {
    
    lazy var loginButton: UIButton = {
        getFocusButton(with: EPConstants.loginButtonTitle)
    }()
    
    lazy var usernameInput: UITextField = {
        getInputTextView(with: EPConstants.usernameInputPlaceholder)
    }()
    
    lazy var tipLabel: UILabel = {
        getTipLabel(with: EPConstants.loginTipText)
    }()
    
    lazy var logoImage: UIImageView = {
        let i = UIImageView()
        i.image = EPConstants.logoImage
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    lazy var registerButton: UIButton = {
        getSecondaryButton(with: EPConstants.registerButtonTitle)
    }()
    
    lazy var loginView: UIView = {
        let v = UIView()
        
        v.addSubview(logoImage)
        v.addSubview(tipLabel)
        v.addSubview(usernameInput)
        v.addSubview(loginButton)
        v.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            logoImage.widthAnchor.constraint(equalToConstant: EPConstants.logoSize.width),
            logoImage.heightAnchor.constraint(equalToConstant: EPConstants.logoSize.height),
            logoImage.centerXAnchor.constraint(equalTo: v.safeAreaLayoutGuide.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: v.topAnchor),
            
            tipLabel.centerXAnchor.constraint(equalTo: v.safeAreaLayoutGuide.centerXAnchor),
            tipLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: EPConstants.padding),
            
            usernameInput.heightAnchor.constraint(equalToConstant: EPConstants.interactiveSize.height),
            usernameInput.leadingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.leadingAnchor),
            usernameInput.trailingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.trailingAnchor),
            usernameInput.topAnchor.constraint(equalTo: tipLabel.bottomAnchor, constant: EPConstants.padding),
            
            loginButton.heightAnchor.constraint(equalToConstant: EPConstants.interactiveSize.height),
            loginButton.leadingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.trailingAnchor),
            loginButton.topAnchor.constraint(equalTo: usernameInput.bottomAnchor, constant: EPConstants.padding),
            
            registerButton.heightAnchor.constraint(equalToConstant: EPConstants.interactiveSize.height),
            registerButton.leadingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: v.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
}
