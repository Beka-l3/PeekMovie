//
//  ViewModels.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 25.10.2022.
//

import UIKit

enum ColorForFade {
    case black, white, yellow
}

enum GradientDirectionFrom {
    case top, bottom, left, right
}

protocol FadingLayers: ColorsOld {
    func getFadingLayer2(from: GradientDirectionFrom, locations: [NSNumber], color: ColorForFade, zPos: CGFloat) -> CAGradientLayer
    func getFadingLayer3(from: GradientDirectionFrom, locations: [NSNumber], color: ColorForFade, zPos: CGFloat) -> CAGradientLayer
}

extension FadingLayers {
    func getFadingLayer2(from: GradientDirectionFrom = .bottom, locations: [NSNumber], color: ColorForFade = .white, zPos: CGFloat = 0) -> CAGradientLayer {
        let g = CAGradientLayer()
        
        let (full, clear): (UIColor, UIColor)
        switch color {
        case .black: (full, clear) = (black, clearBlack)
        case .white: (full, clear) = (white, clearWhite)
        case .yellow: (full, clear) = (yellow, clearYellow)
        }
        
        g.type = .axial
        if from == .left || from == .right {
            g.startPoint = CGPoint(x: 0, y: 1)
            g.endPoint = CGPoint(x: 1, y: 1)
        }
        g.colors = (from == .bottom || from == .right) ?  [clear.cgColor, full.cgColor] : [full.cgColor, clear.cgColor]
        g.locations = locations
        g.zPosition = zPos
        return g
    }
    
    func getFadingLayer3(from: GradientDirectionFrom = .bottom, locations: [NSNumber], color: ColorForFade = .white, zPos: CGFloat = 0) -> CAGradientLayer {
        let g = CAGradientLayer()
        
        let (full, semi, clear): (UIColor, UIColor, UIColor)
        switch color {
        case .black: (full, semi, clear) = (black, semiBlack, clearBlack)
        case .white: (full, semi, clear) = (white, semiWhite, clearWhite)
        case .yellow: (full, semi, clear) = (yellow, semiYellow, clearYellow)
        }
        
        g.type = .axial
        if from == .left || from == .right {
            g.startPoint = CGPoint(x: 0, y: 1)
            g.endPoint = CGPoint(x: 1, y: 1)
        }
        g.colors = (from == .bottom || from == .right) ?  [clear.cgColor, semi.cgColor, full.cgColor] : [full.cgColor, semi.cgColor, clear.cgColor]
        g.locations = locations
        g.zPosition = zPos
        return g
    }
}

protocol MovieInfoViews: ColorsOld {
    func getLabel(font: UIFont, text: String, color: UIColor, lines: Int) -> UILabel
    func getStack(views: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, isEqual: Bool) -> UIStackView
}

extension MovieInfoViews {
    func getLabel(font: UIFont, text: String, color: UIColor = .white, lines: Int = 1) -> UILabel {
        let l = UILabel()
        l.text = text
        l.numberOfLines = lines
        l.textColor = color
        l.font = font
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }
    
    func getStack(views: [UIView], axis: NSLayoutConstraint.Axis = .horizontal, spacing: CGFloat = 0, isEqual: Bool = false) -> UIStackView {
        let s = UIStackView()
        s.axis = axis
        s.spacing = spacing
        if isEqual { s.distribution = .equalCentering }
        for v in views { s.addArrangedSubview(v) }
        
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }
}
