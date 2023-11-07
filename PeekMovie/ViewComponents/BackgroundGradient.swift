//
//  BackgroundGradient.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 07.11.2023.
//

import UIKit


final class BackgroundGradient: CAGradientLayer {
    
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
    
//    MARK: lifecycle
    init(type: GradientType) {
        super.init(layer: CALayer())
        setupLayer(type: type)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
//    MARK: private func
    private func setupLayer(type: GradientType) {
        self.zPosition = -10
        self.frame = .init(origin: .zero, size: UIScreen.main.bounds.size)
        
        if let first = Colors.backgroundPrimary, let second = Colors.backgroundTertiary {
            self.colors = [first.cgColor, second.cgColor]
        }
        
        self.locations = [0.3, 1]
        
        switch type {
            
        case .linearBottom:
            self.type = .axial
            self.startPoint = Points.top
            self.endPoint = Points.bottom
            
        case .linearTop:
            self.type = .axial
            self.startPoint = Points.bottom
            self.endPoint = Points.top
            
        case .linearBottomLeft:
            self.type = .axial
            self.startPoint = Points.topRight
            self.endPoint = Points.bottomLeft
            
        case .linearBottomRight:
            self.type = .axial
            self.startPoint = Points.topLeft
            self.endPoint = Points.bottomRight
            
        case .raidalBottom:
            self.type = .radial
            
        case .raidalTop:
            self.type = .radial

        case .raidalLeft:
            self.type = .radial
            
        case .raidalRight:
            self.type = .radial
            
        }
    }
    
}


extension BackgroundGradient {
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
