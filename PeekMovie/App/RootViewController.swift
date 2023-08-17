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
        label.text = lorem[currentColorIndex]
        label.font = Fonts.thin24
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var someButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Check It Out", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Fonts.bold16
        button.backgroundColor = .systemPurple
        button.tag = 0
        button.layer.cornerRadius = 16
        button.addTarget(self, action: #selector(handleSomeButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    @objc func handleSomeButton() {
        if someButton.tag == 0 {
            someButton.tag = 1
        } else {
            someButton.tag = 0
        }
        
        appCoordinator?.someButtonTapped(tag: someButton.tag)
    }
    
//    MARK: - public func
    
//    MARK: - private func
    private func setupViews() {
        view.backgroundColor = .black
        
        view.addSubview(someLabel)
        view.addSubview(someButton)
        
        NSLayoutConstraint.activate([
            someLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            someLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            
            someButton.heightAnchor.constraint(equalToConstant: 50),
            someButton.widthAnchor.constraint(equalToConstant: 250),
            someButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            someButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: 120),
        ])
    }
    
    private func startAnimation() {
        UIView.animate(withDuration: 0.6, delay: 0, options: [.transitionCrossDissolve, .curveEaseInOut]) {
            self.view.backgroundColor = .white
        } completion: { done in
            UIView.animate(withDuration: 0.6, delay: 5, options: [.transitionCrossDissolve, .curveEaseInOut]) {
                self.view.backgroundColor = .black
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
