//
//  Colors+gradientColorPattern.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 08.11.2023.
//

import UIKit


extension Colors {
    
    static let mainGradientFirst = UIColor(hex: "49E1E1FF")
    static let mainGradientSecondary = UIColor(hex: "3779FAFF")
    
    static func getGradientLayer(bounds: CGRect) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        
        if let first = self.mainGradientFirst, let second = self.mainGradientSecondary {
            gradient.colors = [first.cgColor, second.cgColor]
        } else {
            gradient.colors = [UIColor.systemCyan.cgColor, UIColor.systemBlue.cgColor]
        }
        
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        
        return gradient
    }
    
    static func gradientColor(bounds: CGRect, gradientLayer: CAGradientLayer) -> UIColor? {
        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return UIColor(patternImage: image!)
    }
}
