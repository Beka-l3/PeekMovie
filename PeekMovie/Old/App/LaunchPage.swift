//
//  EntranceView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.10.2022.
//

import UIKit


class LaunchPage: UIViewController, ColorsOld, Animations {
    private lazy var logoImage: UIImageView = {
        let i = UIImageView()
        i.image = EPConstants.logoImage
        i.clipsToBounds = true
        i.backgroundColor = .systemPink
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    lazy var innerCircle: UIView = {
        getCircle(with: EPConstants.largeLogoSize.width / 2, zPos: -1)
    }()
    lazy var middleCircle: UIView = {
        getCircle(with: EPConstants.largeLogoSize.width / 2 + 50, zPos: -2)
    }()
    lazy var outerCircle: UIView = {
        getCircle(with: EPConstants.largeLogoSize.width / 2 + 100, zPos: -3)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = black
        view.addSubview(logoImage)

        NSLayoutConstraint.activate([
            logoImage.widthAnchor.constraint(equalToConstant: EPConstants.largeLogoSize.width),
            logoImage.heightAnchor.constraint(equalToConstant: EPConstants.largeLogoSize.height),
            logoImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        logoImage.layer.cornerRadius = EPConstants.largeLogoSize.width / 2
        
        view.addSubview(innerCircle)
        view.addSubview(middleCircle)
        view.addSubview(outerCircle)
        
        addLogoStrokeAnimation()
    }
    
    private func addLogoStrokeAnimation() {
        let duration = CGFloat(2.1)
        let delay = CGFloat(0.3)
        let animations = getCircularSignalAnimation(
            innerCircle: innerCircle,
            middleCircle: middleCircle,
            outerCircle: outerCircle,
            center: view.center
        )
        let animationOptions: UIView.AnimationOptions = .curveLinear
        let keyframeAnimationOption: UIView.KeyframeAnimationOptions = UIView.KeyframeAnimationOptions(rawValue: animationOptions.rawValue)
        UIView.animateKeyframes(withDuration: duration, delay: delay, options: [.repeat, keyframeAnimationOption], animations: animations)
    }
    
    private func getCircle(with radius: CGFloat, zPos: CGFloat) -> UIView {
        let v = UIView()
        v.frame.size = CGSize(width: radius * 2, height: radius * 2)
        v.center = view.center
        v.layer.zPosition = zPos
        v.layer.cornerRadius = radius
        v.backgroundColor = .clear
        v.layer.borderColor = yellow.cgColor
        return v
    }
}
