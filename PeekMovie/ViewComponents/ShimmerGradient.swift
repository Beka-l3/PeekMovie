//
//  ShimmerGradient.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 22.08.2023.
//

import UIKit

final class ShimmerGradient: CAGradientLayer {
    
    private var _isAnimationRunning = false
    public var isAnimationRunning: Bool {
        get {
            _isAnimationRunning
        }
        
        set {
            _isAnimationRunning = newValue
        }
    }
    
//    MARK: - lifecycle
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    init(
        colors: [CGColor] = [UIColor.lightGray.cgColor, UIColor.white.cgColor, UIColor.lightGray.cgColor],
        startPoint: CGPoint = CGPoint(x: 0, y: 1),
        endPoint: CGPoint = CGPoint(x: 1, y: 1))
    {
        super.init()
        
        isHidden = true
        self.colors = colors
        self.startPoint = startPoint
        self.endPoint = endPoint
    }
    
    required init?(coder: NSCoder) {
//        super.init(coder: coder)
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Exposed func
    public func startAnimation() {
        guard !isAnimationRunning else {
            return
        }
        isAnimationRunning = true
        isHidden = false

        let startLocations: [NSNumber] = [-1, -0.5, 0]
        let endLocations: [NSNumber] = [1, 1.5, 2]
        locations = startLocations

        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = startLocations
        animation.toValue = endLocations
        animation.duration = 1
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)

        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 2
        animationGroup.animations = [animation]
        animationGroup.repeatCount = .infinity
        add(animationGroup, forKey: animation.keyPath)
    }
    
    func stopAnimation() {
        isAnimationRunning = false
        isHidden = true
        removeAllAnimations()
    }
}
