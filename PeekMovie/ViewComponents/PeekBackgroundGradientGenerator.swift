//
//  PeekBackgroundGradientGenerator.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 04.12.2023.
//

import UIKit


final class PeekBackgroundGradientGenerator {
    
    static let shared: PeekBackgroundGradientGenerator = .init()
    
    enum GradientType {
        case linearBottom
        case linearTop
        case linearBottomLeft
        case linearBottomRight
        
        case raidalBottom
        case raidalTop
        case raidalLeft
        case raidalRight
    }
    
    
    init() {
        
    }
    
    
    func getGradient(type: GradientType) -> CAGradientLayer {
        let layer = CAGradientLayer()
        
        layer.zPosition = -10
        layer.frame = .init(origin: .zero, size: UIScreen.main.bounds.size)
        
        if let first = Colors.backgroundPrimary, let second = Colors.backgroundTertiary {
            layer.colors = [first.cgColor, second.cgColor]
        }
        
        layer.locations = [0.3, 1]
        
        switch type {
            
        case .linearBottom:
            layer.type = .axial
            layer.startPoint = Points.top
            layer.endPoint = Points.bottom
            
        case .linearTop:
            layer.type = .axial
            layer.startPoint = Points.bottom
            layer.endPoint = Points.top
            
        case .linearBottomLeft:
            layer.type = .axial
            layer.startPoint = Points.topRight
            layer.endPoint = Points.bottomLeft
            
        case .linearBottomRight:
            layer.type = .axial
            layer.startPoint = Points.topLeft
            layer.endPoint = Points.bottomRight
            
        case .raidalBottom:
            layer.type = .radial
            
        case .raidalTop:
            layer.type = .radial

        case .raidalLeft:
            layer.type = .radial
            
        case .raidalRight:
            layer.type = .radial
            
        }
        
        return layer
    }
    
}


extension PeekBackgroundGradientGenerator {
    enum Points {
        static let topLeft: CGPoint = .init(x: 0, y: 0)
        static let top: CGPoint = .init(x: 0.5, y: 0)
        static let topRight: CGPoint = .init(x: 1, y: 0)
        
        static let bottomLeft: CGPoint = .init(x: 0, y: 1)
        static let bottom: CGPoint = .init(x: 0.5, y: 1)
        static let bottomRight: CGPoint = .init(x: 1, y: 1)
        
        static let left: CGPoint = .init(x: 0, y: 0.5)
        static let center: CGPoint = .init(x: 0.5, y: 0.5)
        static let right: CGPoint = .init(x: 1, y: 0.5)
    }
}
