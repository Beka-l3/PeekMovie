//
//  PeekBackgroundImageView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 12.11.2023.
//

import UIKit

final class PeekBackgroundImageView: UIImageView {
    
    
//    MARK: lifecycle
    init(image: UIImage?, opacity: Float = 0.6) {
        super.init(frame: .zero)
        
        setupView(image: image, opacity: opacity)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    
//    MARK: private func
    private func setupView(image: UIImage?, opacity: Float) {
        self.image = image
        contentMode = .scaleAspectFill
        layer.opacity = opacity
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}
