//
//  SignInPage+Extension.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 22.08.2023.
//

import UIKit


extension SignInPageViewComponents {
    enum Constants {
        static let usernameTextFieldPlaceholder = "Username"
        static let emailTextFieldPlaceholder = "Email"
        static let passwordTextFieldPlaceholder = "Password"
        
        static let loginButtonTitleText = "Login"
        static let signUpButtonTitleText = "Sign Up"
        static let signInButtonTitleText = "Sign In"
        static let forgotPasswordButtonTitleText = "forgot password?"
        
        static let signUpLabelText = "If you do not have a peek id"
        static let signInLabelText = "If you have a peek id"
        
        static let appLogoIconViewYOrigin: CGFloat = 96
        static let inputBlockYOrigin: CGFloat = 342
        
        static let paddingXXS: CGFloat = 4
        static let paddingXS: CGFloat = 6
        static let paddingS: CGFloat = 10
        static let padding: CGFloat = 16
        static let paddingL: CGFloat = 36
        static let paddingXL: CGFloat = 48
        static let paddingXXL: CGFloat = 52
        
        static let screenHeight: CGFloat = UIScreen.main.bounds.height
        static let screenWidth: CGFloat = UIScreen.main.bounds.width
        
        static let bottomHStackViewHeight: CGFloat = Fonts.bold14?.pointSize ?? 15
        static let userInputFieldHeight: CGFloat = Fonts.regular14?.pointSize ?? 15
        static let mainButtonHeight: CGFloat = Fonts.bold18?.pointSize ?? 19
        
        static let appLogoHeight: CGFloat = 90
        
        static var signUpBlockHeight: CGFloat {
            3 * userInputFieldHeight + 2 * paddingL + paddingXL + mainButtonHeight
        }
        
        static var inputBlockAvailableSpaceHeight: CGFloat {
            screenHeight - (appLogoIconViewYOrigin + appLogoHeight + bottomHStackViewHeight + paddingL)
        }
        
        static var inputBlockPadding: CGFloat {
            (inputBlockAvailableSpaceHeight - signUpBlockHeight) / 2
        }
    }
}
