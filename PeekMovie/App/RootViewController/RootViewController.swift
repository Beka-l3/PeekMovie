//
//  RootViewController.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.08.2023.
//

import UIKit
import NVActivityIndicatorView


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
    
    lazy var nvActivityIndicatorView: NVActivityIndicatorView = {
        let view = NVActivityIndicatorView(frame: Constants.nvActivityIndicatorViewFrame, type: .ballTrianglePath, color: .systemYellow)
        return view
    }()
    
    var lorem = ["Hello World!", "Privet Beka!", "Salem Kamil!", "Hola Senior!"]
    var currentColorIndex = 0
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
        view.backgroundColor = .black
        
        view.addSubview(background)
        view.addSubview(someLabel)
        view.addSubview(nvActivityIndicatorView)
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            someLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            someLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
    }
    
    private func setupFrames() {
        nvActivityIndicatorView.center = view.center
    }
    
}


extension RootViewController {
    private func startAnimation() {
        nvActivityIndicatorView.startAnimating()
//        UIView.animate(withDuration: 0.6, delay: 0, options: [.transitionCrossDissolve, .curveEaseInOut]) {
//            self.background.backgroundColor = .white
//        } completion: { done in
//            UIView.animate(withDuration: 0.6, delay: 5, options: [.transitionCrossDissolve, .curveEaseInOut]) {
//                self.background.backgroundColor = .black
//            } completion: { done in
//                if let appCoordinator = self.appCoordinator, !appCoordinator.didlaunchScreenFinishAnimation {
//                    appCoordinator.didlaunchScreenFinishAnimation = true
//                }
//
//                self.currentColorIndex = (self.currentColorIndex + 1) % self.lorem.count
//                self.someLabel.text = self.lorem[self.currentColorIndex]
//                self.startAnimation()
//            }
//        }
    }
    
    private func stopAnimation() {
        nvActivityIndicatorView.stopAnimating()
    }
    
}


extension RootViewController {
    enum Constants {
        static let nvActivityIndicatorViewFrame: CGRect = .init(origin: .zero, size: .init(width: 100, height: 100))
    }
}
