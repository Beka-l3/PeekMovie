//
//  PasswordRestorationViewController+ValidateEmail.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 07.12.2023.
//

import UIKit


extension PasswordRestorationViewController {
    
    func isValidEmailAddress(emailAddressString: String) -> Bool {
        
        var returnValue = true
        let emailRegEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        do {
            returnValue = try checkStringWithRegex(emailAddressString, emailRegEx)
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return  returnValue
    }
    
    /// Minimum 8 characters at least 1 Alphabet and 1 Number
    func isValidPassword(passwordString: String) -> Bool {
        
        var returnValue = true
        let passwordRegEx = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$"
        
        do {
            returnValue = try checkStringWithRegex(passwordString, passwordRegEx)
            
        } catch let error as NSError {
            print("invalid regex: \(error.localizedDescription)")
            returnValue = false
        }
        
        return returnValue
    }
    
    
    private func checkStringWithRegex(_ givenString: String, _ givenRegex: String) throws -> Bool {
        
        let regex = try NSRegularExpression(pattern: givenRegex)
        let nsString = givenString as NSString
        let results = regex.matches(in: givenString, range: NSRange(location: 0, length: nsString.length))
        
        if results.count == 0 {
            return false
        }
        
        return true
    }
}
