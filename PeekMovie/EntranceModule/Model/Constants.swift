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
    static let startButtonSize: CGSize = CGSize(width: 60, height: 60)
    
    static let idText = "ID"
    static let emptyText = ""
    
    static let loginButtonTitle = "Log In"
    static let continueButtonTitle = "Continue"
    static let registerButtonTitle = "Register"
    static let forgotPasswordButtonTitle = "Forgot password or don’t have one yet?"
    
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
    
    static let joinTipText = "Join in to a Room\nas "
    static let roomIdIntupPlaceholder = "Enter Room ID"
    static let incorrectRoomIdIntupPlaceholder = "Incorrect room ID"
    static let joinButtonTitle = "Join"
    static let orTipText = "Or"
    static let createButtonTitle = "Create"
    static let logOutButtonTitle = "Log Out"
    
    static let waitingTipText = "Waiting"
    static let waitingDetailText = "Waiting for admin to start the session"
    static let roomText = "Room "
    static let startButtonTitle = "START"
    static let cancelButtonTitle = "Cancel"
    
    static let expandDuration: TimeInterval = 0.4
    static let fadeDuration: TimeInterval = 0.4
    static let borderWidth: CGFloat = 2.5
    static let innerCircleSize = CGSize(width: 60, height: 60)
    static let middleCircleSize = CGSize(width: 90, height: 90)
    static let outerCircleSize = CGSize(width: 120, height: 120)
    static let expandedInnerCircleSize = CGSize(width: 65, height: 65)
    static let expandedMiddleCircleSize = CGSize(width: 95, height: 95)
    static let expandedOuterCircleSize = CGSize(width: 125, height: 125)
    
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

