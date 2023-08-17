//
//  UserService.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.08.2023.
//

import UIKit
import Security

final class UserService {
    
    enum Constants {
        static let accessTokenKey = "AccessTokenKey"
    }
    
    var accessToken: String? {
        get {
            Service.retrieveTokenFromKeyChain(forKey: Constants.accessTokenKey)
        }
        
        set {
            if let newValue = newValue {
                let _ = Service.saveTokenIntoKeyChain(newValue, forKey: Constants.accessTokenKey)
            } else {
                let _ = Service.removeTokenFromKeyChain(forKey: Constants.accessTokenKey)
            }
        }
    }
    
    
    func loggedIn() {
//        self.user = user
    }
    
    func signOut() {
        accessToken = nil
//        fcmToken = nil
//        user = nil
    }
    
}
