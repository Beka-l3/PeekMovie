//
//  PeekIconView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 05.11.2023.
//

import UIKit


final class PeekIconView: UIImageView {
    
    enum IconSize: CGFloat {
        case x24 = 24
        case x90 = 90
    }
    
    let iconSize: IconSize
    
//    MARK: lifecycle
    init(image: UIImage?, size: IconSize = .x24, cornerRadius: CGFloat? = nil, withShadow: Bool = false) {
        self.iconSize = size
        super.init(frame: .zero)
        
        setupView(image: image, size: size, cornerRadius: cornerRadius ?? .zero, withShadow: withShadow)
    }
    
    required init?(coder: NSCoder) {
        self.iconSize = .x24
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
//    MARK: private func
    private func setupView(image: UIImage?, size: IconSize, cornerRadius: CGFloat, withShadow: Bool) {
        self.image = image
        self.layer.cornerRadius = cornerRadius
        
        if withShadow {
            layer.shadowRadius = Constants.shadowRadius
            layer.shadowOpacity = Constants.shadowOpacity
        }
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}


extension PeekIconView {
    enum Constants {
        static let shadowRadius: CGFloat = 16
        static let shadowOpacity: Float = 0.38
    }
}
