//
//  LobbyViewController+NavigationAnimation.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 23.12.2023.
//

import UIKit


extension LobbyViewController {
    
    func prepareForInNavigationAnimation(from: AppCoordinator.ModuleType) {
        
        switch from {
        
        case .none:
            break
            
        case .entrance:
            viewComponents.usernameLabel.alpha = 0
            viewComponents.usernameIconView.alpha = 0
            viewComponents.roomIdTextField.alpha = 0
            viewComponents.roomIdIconView.alpha = 0
            
            viewComponents.mainButton.alpha = 0
            viewComponents.secondaryButton.alpha = 0
            viewComponents.tertiaryButton.alpha = 0
            
            viewComponents.createRoomHStack.alpha = 0
            
        case .lobby:
            break
            
        case .session:
            break
            
        }
        
        isInNavigationAnimationNeeded = true
    }
    
    func startOutNavigationAnimation(destination: AppCoordinator.ModuleType) async {
        
        switch destination {
        
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
    
    func startInNavigationAnimation() {
        guard isInNavigationAnimationNeeded else { return }
        
        UIView.animate(withDuration: Constants.Animation.durationDefault / 2) { [unowned self] in
            self.viewComponents.usernameLabel.alpha = 1
            self.viewComponents.usernameIconView.alpha = 1
            self.viewComponents.roomIdTextField.alpha = 1
            self.viewComponents.roomIdIconView.alpha = 1
            
            self.viewComponents.mainButton.alpha = 1
            self.viewComponents.secondaryButton.alpha = 1
            self.viewComponents.tertiaryButton.alpha = 1
            
            self.viewComponents.createRoomHStack.alpha = 1
        }
        
        isInNavigationAnimationNeeded = false
    }
    
    func resetAfterOutNavigationAnimation() {
        
    }
    
}
