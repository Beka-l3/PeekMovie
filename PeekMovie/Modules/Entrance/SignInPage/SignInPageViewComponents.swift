//
//  SignInPageViewComponents.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 22.08.2023.
//

import UIKit

final class SignInPageViewComponents {
    
    enum Constants {
        
    }
    
    var usernameTextField: InputTextField = .init()
    
    
    func setupViews(parent: UIView) {
        parent.backgroundColor = .systemPurple
        
        parent.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerYAnchor),
            usernameTextField.widthAnchor.constraint(equalToConstant: 250),
            usernameTextField.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupLayers() {
        usernameTextField.setupLayers(size: .init(width: 250, height: 50))
    }
}
