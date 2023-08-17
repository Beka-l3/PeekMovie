//
//  WaitingPageAnimation.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 21.10.2022.
//

import UIKit

extension WaitingRoomViewComponents {
    
    internal func expandStroke() {
        UIView.animate(withDuration: EPConstants.expandDuration, delay: .zero, options: []) { [weak self] in
            guard let self = self else {return}
            self.circles[0].layer.borderWidth = EPConstants.borderWidth
            self.circles[0].frame.size = EPConstants.expandedInnerCircleSize
            self.circles[0].layer.cornerRadius = EPConstants.expandedInnerCircleSize.width / 2
            self.circles[0].center = self.startButton.center
        } completion: { [weak self]done in
            UIView.animate(withDuration: EPConstants.expandDuration, delay: .zero, options: []) { [weak self] in
                guard let self = self else {return}
                self.circles[1].layer.borderWidth = EPConstants.borderWidth
                self.circles[1].frame.size = EPConstants.expandedMiddleCircleSize
                self.circles[1].layer.cornerRadius = EPConstants.expandedMiddleCircleSize.width / 2
                self.circles[1].center = self.startButton.center
            } completion: { [weak self]done in
                UIView.animate(withDuration: EPConstants.expandDuration, delay: .zero, options: []) { [weak self] in
                    guard let self = self else {return}
                    self.circles[2].layer.borderWidth = EPConstants.borderWidth
                    self.circles[2].frame.size = EPConstants.expandedOuterCircleSize
                    self.circles[2].layer.cornerRadius = EPConstants.expandedOuterCircleSize.width / 2
                    self.circles[2].center = self.startButton.center
                } completion: { [weak self]done in
                    guard let self = self else {return}
                    self.fadeStroke()
                }
            }
        }
    }
    
    internal func fadeStroke() {
        UIView.animate(withDuration: EPConstants.fadeDuration, delay: .zero, options: []) {[weak self] in
            guard let self = self else {return}
            self.circles[0].layer.opacity = .zero
        } completion: { [weak self]done in
            guard let self = self else {return}
            self.circles[0].layer.borderWidth = .zero
            self.circles[0].frame.size = EPConstants.innerCircleSize
            self.circles[0].center = self.startButton.center
            self.circles[0].layer.opacity = 1
        }
        UIView.animate(withDuration: EPConstants.fadeDuration, delay: EPConstants.fadeDuration/2, options: []) {[weak self] in
            guard let self = self else {return}
            self.circles[1].layer.opacity = .zero
        } completion: { [weak self]done in
            guard let self = self else {return}
            self.circles[1].layer.borderWidth = .zero
            self.circles[1].frame.size = EPConstants.middleCircleSize
            self.circles[1].center = self.startButton.center
            self.circles[1].layer.opacity = 1
        }
        UIView.animate(withDuration: EPConstants.fadeDuration, delay: EPConstants.fadeDuration, options: []) {[weak self] in
            guard let self = self else {return}
            self.circles[2].layer.opacity = .zero
        } completion: { [weak self]done in
            guard let self = self else {return}
            self.circles[2].layer.borderWidth = .zero
            self.circles[2].frame.size = EPConstants.outerCircleSize
            self.circles[2].center = self.startButton.center
            self.circles[2].layer.opacity = 1
            
            self.expandStroke()
        }
    }
    
}
