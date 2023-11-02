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
    
    lazy var appTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.appTitle
        label.font = Fonts.bold24
        label.textColor = .systemYellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nvActivityIndicatorView: NVActivityIndicatorView = {
        let view = NVActivityIndicatorView(frame: Constants.nvActivityIndicatorViewFrame, type: .ballTrianglePath, color: .systemYellow)
        return view
    }()
    
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
        view.addSubview(appTitleLabel)
        view.addSubview(nvActivityIndicatorView)
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            appTitleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            appTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: Constants.appTitleLabelTopAnchorConstant),
        ])
    }
    
    private func setupFrames() {
        nvActivityIndicatorView.center = view.center
    }
    
}


extension RootViewController {
    private func startAnimation() {
        nvActivityIndicatorView.startAnimating()
        UIView.animate(withDuration: 1.2, delay: 0, options: [.transitionCrossDissolve, .curveEaseInOut]) {
            self.nvActivityIndicatorView.startAnimating()
        } completion: { done in
            if let appCoordinator = self.appCoordinator, !appCoordinator.didlaunchScreenFinishAnimation {
                appCoordinator.didlaunchScreenFinishAnimation = true
            }
        }
    }
    
    private func stopAnimation() {
        nvActivityIndicatorView.stopAnimating()
    }
    
}


extension RootViewController {
    enum Constants {
        static let nvActivityIndicatorViewSize: CGFloat = 100
        static let nvActivityIndicatorViewFrame: CGRect = .init(origin: .zero, size: .init(width: 100, height: nvActivityIndicatorViewSize))
        
        static let appTitle = "Peek Movie"
        
        static let padding: CGFloat = 16
        
        static let appTitleLabelTopAnchorConstant: CGFloat = nvActivityIndicatorViewSize / 2 + padding
    }
}

