//
//  LobbyViewComponents+Constants.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 12.12.2023.
//

import UIKit


extension LobbyViewComponents {
    
    enum Constants {
        
        static let usernameLabelTextDefault = "Username"
        
        static let roomidTextFieldPlaceholder = "Room ID"
        
        static let joinButtonTitleText = "JOIN"
        static let createButtonTitleText = "Create Room"
        static let logOutButtonTitleText = "Log Out"
        
        static let createRoomLabelText = "If you do not have room id"
        
        static let paddingXXS: CGFloat = 4
        static let paddingXS: CGFloat = 6
        static let paddingS: CGFloat = 10
        static let padding: CGFloat = 16
        static let paddingM: CGFloat = 24
        static let paddingL: CGFloat = 36
        static let paddingXL: CGFloat = 48
        static let paddingXXL: CGFloat = 52
        static let paddingXXXL: CGFloat = 96
        static let paddingXXXXL: CGFloat = 144
        
        static let appLogoHeight: CGFloat = 90
        static let inputFieldHeight: CGFloat = 24
        
        static let mainButtonMaxWidth: CGFloat = 75
        static let mainButtonMaxHeight: CGFloat = 30
        
        static let inputBlockShadowOffset: CGSize = .zero
        static let inputBlockShadowColor: CGColor = UIColor.black.cgColor
        static let inputBlockShadowRadius: CGFloat = 64
        static let inputBlockShadowOpacity: Float = 1
        
        static let screenHeight: CGFloat = UIScreen.main.bounds.height
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        
        static var inputBlockHeight: CGFloat {
            screenHeight - 2 * paddingXL - appLogoHeight
        }
    }
    
}
