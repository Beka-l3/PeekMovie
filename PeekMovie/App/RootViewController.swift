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
        label.font = Fonts.regular8
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
        view.backgroundColor = .white
        
        view.addSubview(someLabel)
        
        NSLayoutConstraint.activate([
            someLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            someLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    private func startAnimation() {
        Task {
            sleep(3)
            appCoordinator?.launchScreenDidFinishAnimation = true
        }
    }
    
}
