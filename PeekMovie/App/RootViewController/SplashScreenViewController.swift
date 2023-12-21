//
//  RootViewController.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.08.2023.
//

import UIKit
import NVActivityIndicatorView


final class SplashScreenViewController: UIViewController {
    
    var appCoordinator: AppCoordinator?
    private let viewComponents: SplashScreenViewControllerComponents = .init()
    
    var didAnimationStart = false
    
    
    //    MARK: lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupFrames()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !didAnimationStart {
            didAnimationStart = true
            startAnimation()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopAnimation()
    }
    
    
    //    MARK:  private func
    private func setupViews() {
        viewComponents.setupViews(parent: view)
    }
    
    private func setupFrames() {
        viewComponents.setupFrames(parent: view)
    }
    
}


extension SplashScreenViewController {
    private func startAnimation() {
        viewComponents.nvActivityIndicatorView.startAnimating()
        
        Task {
            do {
                try await Task.sleep(nanoseconds: 1_200_000_000)
            } catch {
                print("Failed to sleep")
            }
            
            if let appCoordinator = self.appCoordinator, !appCoordinator.didlaunchScreenFinishAnimation {
                appCoordinator.didlaunchScreenFinishAnimation = true
            }
        }
    }
    
    private func stopAnimation() {
        viewComponents.nvActivityIndicatorView.stopAnimating()
    }
}

