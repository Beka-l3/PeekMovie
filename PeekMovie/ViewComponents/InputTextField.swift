//
//  InputTextField.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 22.08.2023.
//

import UIKit

final class InputTextField: UITextField {
    
    private lazy var shimmer: ShimmerGradient = .init()
    
//    MARK: - lifecycle
    init() {
        super.init(frame: .zero)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupLayers()
    }
    
    
//    MARK: - Exposed func
    public func setupLayers(size: CGSize) {
        shimmer.frame = .init(origin: .zero, size: size)
    }
    
    public func startAnimation() {
        shimmer.startAnimation()
    }
    
    public func stopAnimation() {
        shimmer.stopAnimation()
    }
    
//    MARK: - private func
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        clipsToBounds = true
        layer.borderWidth = 0.5
        layer.borderColor = UIColor(hex: "FFFFFF")?.cgColor
        layer.cornerRadius = 12
        
        layer.addSublayer(shimmer)
    }
    
    private func setupLayers() {
        shimmer.frame = .init(origin: .zero, size: bounds.size)
    }
    
}
