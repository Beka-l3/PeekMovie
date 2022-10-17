//
//  RegisterPageViewModels.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 14.10.2022.
//

import UIKit


class RegisterPageViewModels: Colors, Fonts, Interactives, Informatives {
    
    lazy var registerButton: UIButton = {
        getFocusButton(with: EPConstants.registerButtonTitle)
    }()
    
    lazy var usernameInput: UITextField = {
        getInputTextView(with: EPConstants.usernameInputPlaceholder)
    }()
    
    lazy var emailInput: UITextField = {
        getInputTextView(with: EPConstants.emailInputPlaceholder)
    }()
    
    lazy var passwordInput: UITextField = {
        getInputTextView(with: EPConstants.passwordInputPlaceholder)
    }()
    
    lazy var tipLabel: UILabel = {
        getTipLabel(with: EPConstants.registerTipText)
    }()
    
    lazy var detailLabel: UILabel = {
        getDetailLabel(text: EPConstants.registerDetailText)
    }()
    
    lazy var logoImage: UIImageView = {
        let i = UIImageView()
        i.image = EPConstants.logoImage
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    lazy var IDLabel: UILabel = {
        getTipLabel(with: EPConstants.idText)
    }()
    
    lazy var hStackView: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.addArrangedSubview(logoImage)
        s.addArrangedSubview(IDLabel)
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    lazy var registerView: UIView = {
        let v = UIView()
        
        v.addSubview(hStackView)
        v.addSubview(tipLabel)
        v.addSubview(detailLabel)
        v.addSubview(usernameInput)
        v.addSubview(emailInput)
        v.addSubview(passwordInput)
        v.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            logoImage.widthAnchor.constraint(equalToConstant: EPConstants.smallLogoSize.width),
            logoImage.heightAnchor.constraint(equalToConstant: EPConstants.smallLogoSize.height),
            
            hStackView.centerXAnchor.constraint(equalTo: v.safeAreaLayoutGuide.centerXAnchor),
            hStackView.topAnchor.constraint(equalTo: v.topAnchor),
            
            tipLabel.centerXAnchor.constraint(equalTo: v.safeAreaLayoutGuide.centerXAnchor),
            tipLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: EPConstants.padding),
            
            detailLabel.centerXAnchor.constraint(equalTo: v.safeAreaLayoutGuide.centerXAnchor),
            detailLabel.topAnchor.constraint(equalTo: tipLabel.bottomAnchor, constant: EPConstants.smallPadding),
            
            usernameInput.heightAnchor.constraint(equalToConstant: EPConstants.interactiveSize.height),
            usernameInput.leadingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.leadingAnchor),
            usernameInput.trailingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.trailingAnchor),
            usernameInput.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: EPConstants.padding),
            
            emailInput.heightAnchor.constraint(equalToConstant: EPConstants.interactiveSize.height),
            emailInput.leadingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.leadingAnchor),
            emailInput.trailingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.trailingAnchor),
            emailInput.topAnchor.constraint(equalTo: usernameInput.bottomAnchor, constant: EPConstants.smallPadding),
            
            passwordInput.heightAnchor.constraint(equalToConstant: EPConstants.interactiveSize.height),
            passwordInput.leadingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.leadingAnchor),
            passwordInput.trailingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.trailingAnchor),
            passwordInput.topAnchor.constraint(equalTo: emailInput.bottomAnchor, constant: EPConstants.smallPadding),
            
            registerButton.heightAnchor.constraint(equalToConstant: EPConstants.interactiveSize.height),
            registerButton.leadingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: v.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
}
