//
//  Constants.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 15.10.2022.
//

import UIKit

enum EPConstants {
    static let smallPadding: CGFloat = 16
    static let padding: CGFloat = 32
    static let largePadding: CGFloat = 64
    
    static let interactiveSize: CGSize = CGSize(width: 0, height: 40)
    
    static let smallLogoSize: CGSize = CGSize(width: 40, height: 40)
    static let logoSize: CGSize = CGSize(width: 90, height: 90)
    static let largeLogoSize: CGSize = CGSize(width: 180, height: 180)
    
    static let idText = "ID"
    static let emptyText = ""
    
    static let loginButtonTitle = "Log In"
    static let continueButtonTitle = "Continue"
    static let registerButtonTitle = "Register"
    static let informativeButtonTitle = "Forgot password or don’t have one yet?"
    
    static let usernameInputPlaceholder = "Enter username"
    static let emailInputPlaceholder = "Enter email"
    static let passwordInputPlaceholder = "Enter password"
    
    static let incorrectUsernameInputPlaceholder = "Incorrect username"
    static let incorrectEmailInputPlaceholder = "Incorrect email"
    static let incorrectPasswordInputPlaceholder = "Incorrect password"
    
    static let loginTipText = "Sign in to Peek ID"
    static let passwordTipText = "Enter your Peek ID password"
    static let passwordDetailText = "Use the same password given when singing up\nwith "
    static let registerTipText = "Register new Peek ID"
    static let registerDetailText = "Enter unique username and email\nPassword should contail at least 8 symbols"
    
    static let logoImage: UIImage = UIImage(named: "Logo")!
}

enum IConstants {
    static let cornerRadius: CGFloat = 12
    
    static let shadowOpacity: Float = 0.5
    static let shadowOpacityHalf: Float = 0.25
    static let shadowRadius: CGFloat = 4
    static let shadowOffset: CGSize = CGSize(width: 0, height: 4)
    
    static let borderWidth: CGFloat = 1
    
    static let padding: CGFloat = 12
}

