//
//  EntranceView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 13.10.2022.
//

import UIKit

protocol EntrancePagePresenter: AnyObject {
    func pushEntrancePage()
}

class EntrancePage: UIViewController, Colors {
    
    weak var presenter: EntrancePagePresenter?
    
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
//        presenter?.pushEntrancePage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        addLogoStrokeAnimation()
    }
    
    private func addLogoStrokeAnimation() {
        let duration = CGFloat(2.1)
        let scale = CGFloat(10)
        
        let innerRadius = self.innerCircle.frame.size.width + scale
        let innerSize = CGSize(width: innerRadius, height: innerRadius)
        
        let middleRadius = self.middleCircle.frame.size.width + scale
        let middleSize = CGSize(width: middleRadius, height: middleRadius)
        
        let outerRadius = self.outerCircle.frame.size.width + scale
        let outerSize = CGSize(width: outerRadius, height: outerRadius)
        
        let animations = { [weak self] in
            guard let self = self else { return }
            UIView.addKeyframe(withRelativeStartTime: .zero, relativeDuration: 0.2) {
                self.innerCircle.frame.size = innerSize
                self.innerCircle.layer.cornerRadius = innerRadius/2
                self.innerCircle.layer.borderWidth = scale/2
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.1) {
                self.innerCircle.layer.opacity = .zero
            }
            UIView.addKeyframe(withRelativeStartTime: .zero, relativeDuration: .zero) {
                self.innerCircle.center = self.view.center
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.2) {
                self.middleCircle.frame.size = middleSize
                self.middleCircle.layer.cornerRadius = middleRadius/2
                self.middleCircle.layer.borderWidth = scale/2
            }
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.1) {
                self.middleCircle.layer.opacity = .zero
            }
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: .zero) {
                self.middleCircle.center = self.view.center
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.2) {
                self.outerCircle.frame.size = outerSize
                self.outerCircle.layer.cornerRadius = outerRadius/2
                self.outerCircle.layer.borderWidth = scale/2
            }
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1) {
                self.outerCircle.layer.opacity = .zero
            }
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: .zero) {
                self.outerCircle.center = self.view.center
            }
        }
        let animationOptions: UIView.AnimationOptions = .curveLinear
        let keyframeAnimationOptions: UIView.KeyframeAnimationOptions = UIView.KeyframeAnimationOptions(rawValue: animationOptions.rawValue)
        UIView.animateKeyframes(withDuration: duration, delay: 0.3, options: [keyframeAnimationOptions], animations: animations) { [weak self] _ in
            guard let self = self else {return}
            self.presenter?.pushEntrancePage()
        }
    }
    
    private func getCircle(with radius: CGFloat, zPos: CGFloat) -> UIView {
        let v = UIView()
        v.frame = CGRect(x: .zero, y: .zero, width: radius * 2, height: radius * 2)
        v.center = view.center
        v.layer.zPosition = zPos
        v.layer.cornerRadius = radius
        v.backgroundColor = .clear
        v.layer.borderColor = yellow.cgColor
        return v
    }
}
