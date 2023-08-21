//
//  RootViewController.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.08.2023.
//

import UIKit

final class RootViewController: UIViewController {
    
    var appCoordinator: AppCoordinator?
    
    lazy var background: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var someLabel: UILabel = {
        let label = UILabel()
        label.text = lorem[currentColorIndex]
        label.font = Fonts.thin24
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
        
    var lorem = ["Hello World!", "Privet Beka!", "Salem Kamil!", "Hola Senior!"]
    var currentColorIndex = 0
    var didAnimationStart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !didAnimationStart {
            didAnimationStart = true
            startAnimation()
        }
    }
    
//    MARK: - objc
    
//    MARK: - public func
    
//    MARK: - private func
    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(background)
        view.addSubview(someLabel)
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            someLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            someLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    private func startAnimation() {
        UIView.animate(withDuration: 0.6, delay: 0, options: [.transitionCrossDissolve, .curveEaseInOut]) {
            self.background.backgroundColor = .white
        } completion: { done in
            UIView.animate(withDuration: 0.6, delay: 5, options: [.transitionCrossDissolve, .curveEaseInOut]) {
                self.background.backgroundColor = .black
            } completion: { done in
                if let appCoordinator = self.appCoordinator, !appCoordinator.didlaunchScreenFinishAnimation {
                    appCoordinator.didlaunchScreenFinishAnimation = true
                }

                self.currentColorIndex = (self.currentColorIndex + 1) % self.lorem.count
                self.someLabel.text = self.lorem[self.currentColorIndex]
                self.startAnimation()
            }
        }
    }
    
}
