//
//  PasswordViewModels.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.10.2022.
//

import UIKit


class PasswordViewModels: Colors, Fonts, Interactives, Informatives {
    
    lazy var continueButton: UIButton = {
        getFocusButton(with: EPConstants.continueButtonTitle)
    }()
    
    lazy var passwordInput: UITextField = {
        getInputTextView(with: EPConstants.passwordInputPlaceholder)
    }()
    
    lazy var tipLabel: UILabel = {
        getTipLabel(with: EPConstants.passwordTipText)
    }()
    
    lazy var detailLabel: UILabel = {
        let username = "Ezpzbaby"
        let l = getDetailLabel(text: EPConstants.passwordDetailText, detail: username)
        return l
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
    
    lazy var infomativeButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle(EPConstants.informativeButtonTitle, for: .normal)
        b.setTitleColor(yellow, for: .normal)
        b.backgroundColor = black
        b.titleLabel?.font = infoFont
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    lazy var passwordView: UIView = {
        let v = UIView()
        
        v.addSubview(hStackView)
        v.addSubview(tipLabel)
        v.addSubview(detailLabel)
        v.addSubview(passwordInput)
        v.addSubview(infomativeButton)
        v.addSubview(continueButton)
        
        NSLayoutConstraint.activate([
            logoImage.widthAnchor.constraint(equalToConstant: EPConstants.smallLogoSize.width),
            logoImage.heightAnchor.constraint(equalToConstant: EPConstants.smallLogoSize.height),
            
            hStackView.centerXAnchor.constraint(equalTo: v.safeAreaLayoutGuide.centerXAnchor),
            hStackView.topAnchor.constraint(equalTo: v.topAnchor),
            
            tipLabel.centerXAnchor.constraint(equalTo: v.safeAreaLayoutGuide.centerXAnchor),
            tipLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: EPConstants.padding),
            
            detailLabel.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            detailLabel.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            detailLabel.topAnchor.constraint(equalTo: tipLabel.bottomAnchor, constant: EPConstants.smallPadding),
            
            passwordInput.heightAnchor.constraint(equalToConstant: EPConstants.interactiveSize.height),
            passwordInput.leadingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.leadingAnchor),
            passwordInput.trailingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.trailingAnchor),
            passwordInput.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: EPConstants.padding),
            
            infomativeButton.leadingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.leadingAnchor),
            infomativeButton.topAnchor.constraint(equalTo: passwordInput.bottomAnchor, constant: EPConstants.smallPadding),
            
            continueButton.heightAnchor.constraint(equalToConstant: EPConstants.interactiveSize.height),
            continueButton.leadingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: v.safeAreaLayoutGuide.trailingAnchor),
            continueButton.bottomAnchor.constraint(equalTo: v.safeAreaLayoutGuide.bottomAnchor),
        ])
        
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
}
