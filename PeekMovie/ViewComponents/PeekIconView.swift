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
    init(image: UIImage?, size: IconSize = .x24, cornerRadius: CGFloat? = nil) {
        self.iconSize = size
        super.init(frame: .zero)
        
        setupView(image: image, size: size, cornerRadius: cornerRadius ?? .zero)
    }
    
    required init?(coder: NSCoder) {
        self.iconSize = .x24
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    
//    MARK: private func
    private func setupView(image: UIImage?, size: IconSize, cornerRadius: CGFloat) {
        self.image = image
        self.layer.cornerRadius = cornerRadius
        
        translatesAutoresizingMaskIntoConstraints = false
    }
}

