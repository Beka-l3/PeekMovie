//
//  AuthorizationViewController+NavigationAnimation.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 23.12.2023.
//

import UIKit


extension AuthorizationViewController {
    
    func prepareForInNavigationAnimation(from: AppCoordinator.ModuleType) {
        
        switch from {
        
        case .none:
            break
            
        case .entrance:
            break
            
        case .lobby:
            break
            
        case .session:
            break
            
        }
        
    }
    
    func startOutNavigationAnimation(destination: AppCoordinator.ModuleType) async {
        return await withCheckedContinuation { continuation in
            switch destination {
                
            case .none:
                break
                
            case .entrance:
                break
                
            case .lobby:
                viewComponents.activityLoaderView.stopAnimating()
                viewComponents.appLogoTopAnchorConstraint?.constant = Constants.Padding.XL
                viewComponents.inputBlockTopConstraint?.constant = Constants.Padding.XL
                
                UIView.animate(withDuration: 1) { [unowned self] in
                    
                    self.view.layoutIfNeeded()
                    
                    self.viewComponents.emailTextField.alpha = 0
                    self.viewComponents.emailIconView.alpha = 0
                    self.viewComponents.usernameTextField.alpha = 0
                    self.viewComponents.usernameIconView.alpha = 0
                    self.viewComponents.passwordTextField.alpha = 0
                    self.viewComponents.passwordIconView.alpha = 0
                    
                    self.viewComponents.mainButton.alpha = 0
                    self.viewComponents.secondaryButton.alpha = 0
                    self.viewComponents.tertiaryButton.alpha = 0
                    
                    self.viewComponents.alternatingHStack.alpha = 0
                    
                } completion: { _ in
                    continuation.resume()
                }
                
                break
                
            case .session:
                break
                
            }
        }
        
    }
    
    func startInNavigationAnimation() {
        guard isInNavigationAnimationNeeded else { return }
        
        
    }
    
    func resetAfterOutNavigationAnimation() {
        viewComponents.appLogoTopAnchorConstraint?.constant = Constants.Padding.XXXXL
        viewComponents.inputBlockTopConstraint?.constant = Constants.Padding.XXXXL
        
        self.viewComponents.emailTextField.alpha = 1
        self.viewComponents.emailIconView.alpha = 1
        self.viewComponents.usernameTextField.alpha = 1
        self.viewComponents.usernameIconView.alpha = 1
        self.viewComponents.passwordTextField.alpha = 1
        self.viewComponents.passwordIconView.alpha = 1
        
        self.viewComponents.mainButton.alpha = 1
        self.viewComponents.secondaryButton.alpha = 1
        self.viewComponents.tertiaryButton.alpha = 1
        
        self.viewComponents.alternatingHStack.alpha = 1
    }
    
}
