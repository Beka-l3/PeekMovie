//
//  RootViewController.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.08.2023.
//

import UIKit

final class RootViewController: UIViewController {
    
    var appCoordinator: AppCoordinator?
    
    lazy var someLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello World"
        label.font = Fonts.regular12
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
        startAnimation()
    }
    
    
    
    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(someLabel)

        NSLayoutConstraint.activate([
            someLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            someLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    private func startAnimation() {
        UIView.animate(withDuration: 0.6, delay: 0, options: [.transitionCrossDissolve, .curveEaseInOut]) {
            self.view.backgroundColor = .white
        } completion: { done in
            UIView.animate(withDuration: 0.6, delay: 1.8, options: [.transitionCrossDissolve, .curveEaseInOut]) {
                self.view.backgroundColor = .black
            } completion: { done in
                self.appCoordinator?.launchScreenDidFinishAnimation = true
            }
        }
    }
    
}
