//
//  Service+StringValidation.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 15.12.2023.
//

import Foundation


extension Service {
    
    func isValidEmailAddress(_ emailAddressString: String) -> Bool {
        
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
    func isValidPassword(_ passwordString: String) -> Bool {
        
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
