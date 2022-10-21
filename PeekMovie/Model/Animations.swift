//
//  Animations.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 18.10.2022.
//

import UIKit

protocol Animations {
    func getCircularSignalAnimation(innerCircle i: UIView, middleCircle m: UIView, outerCircle o: UIView, center: CGPoint, scale: CGFloat) -> () -> Void
    func getEnclosingSignalAnimation(innerCircle i: UIView, middleCircle m: UIView, outerCircle o: UIView, scale: CGFloat) -> () -> Void
}

extension Animations {
    func getCircularSignalAnimation(innerCircle i: UIView, middleCircle m: UIView, outerCircle o: UIView, center: CGPoint, scale: CGFloat = 10) -> () -> Void {
        let iR = i.frame.size.width + scale
        let iS = CGSize(width: iR, height: iR)
        
        let mR = m.frame.size.width + scale
        let mS = CGSize(width: mR, height: mR)
        
        let oR = o.frame.size.width + scale
        let oS = CGSize(width: oR, height: oR)
        
        let a = {
            UIView.addKeyframe(withRelativeStartTime: .zero, relativeDuration: 0.2) {
                i.layer.borderWidth = scale/2
                i.frame.size = iS
                i.layer.cornerRadius = iR/2
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.1) {
                i.layer.opacity = 0
            }
            UIView.addKeyframe(withRelativeStartTime: .zero, relativeDuration: .zero) {
                i.center = center
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.2) {
                m.layer.borderWidth = scale/2
                m.frame.size = mS
                m.layer.cornerRadius = mR/2
            }
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.1) {
                m.layer.opacity = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: .zero) {
                m.center = center
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.2) {
                o.layer.borderWidth = scale/2
                o.frame.size = oS
                o.layer.cornerRadius = oR/2
            }
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1) {
                o.layer.opacity = 0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: .zero) {
                o.center = center
            }
        }
        
        return a
    }
    
    func getEnclosingSignalAnimation(innerCircle i: UIView, middleCircle m: UIView, outerCircle o: UIView, scale: CGFloat) -> () -> Void {
        let a = {
            UIView.addKeyframe(withRelativeStartTime: .zero, relativeDuration: 0.2) {
                o.layer.borderWidth = scale
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.1) {
                o.layer.opacity = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.4, relativeDuration: 0.2) {
                m.layer.borderWidth = scale
            }
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.1) {
                m.layer.opacity = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.6, relativeDuration: 0.2) {
                i.layer.borderWidth = scale
            }
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 0.1) {
                i.layer.opacity = 0
            }
        }
        
        return a
    }
}
