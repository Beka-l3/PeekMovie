//
//  PeekCoverView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 12.11.2023.
//

import UIKit


final class PeekCoverView: UIView {
    
    
//    MARK: lifecycle
    init(color: UIColor? = Colors.backgroundCoverGray, opacity: Float = 0.6) {
        super.init(frame: .zero)
        
        setupView(color: color, opacity: opacity)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
//    MARK: private func
    private func setupView(color: UIColor?, opacity: Float) {
        if let color = color {
            backgroundColor = color
        }
        
        layer.opacity = opacity
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}
