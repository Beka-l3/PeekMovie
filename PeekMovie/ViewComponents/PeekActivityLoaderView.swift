//
//  PeekActivityLoaderView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 18.12.2023.
//

import UIKit
import NVActivityIndicatorView


final class PeekActivityLoaderView: UIView {
    
    lazy var bluredBackgroundView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        
        view.alpha = 0.5
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nvActivityIndicatorView: NVActivityIndicatorView = {
        let gradientColor = Colors.gradientColor(bounds: Constants.nvActivityIndicatorViewFrame, type: .main)
        let view = NVActivityIndicatorView(frame: Constants.nvActivityIndicatorViewFrame, type: .circleStrokeSpin, color: gradientColor)
        return view
    }()
    
    
//    MARK: lifecycle
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupFrames()
    }
    
    
//    MARK: exposed func
    public func setupFrames() {
        nvActivityIndicatorView.center = center
    }
    
    
//    MARK: private func
    private func setupView() {
        backgroundColor = .clear
        
        addSubview(bluredBackgroundView)
        addSubview(nvActivityIndicatorView)
        
        NSLayoutConstraint.activate([
            bluredBackgroundView.topAnchor.constraint(equalTo: topAnchor),
            bluredBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bluredBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bluredBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

extension PeekActivityLoaderView {
    
    func startAnimating() {
        becomeFirstResponder()
        alpha = 1
        nvActivityIndicatorView.startAnimating()
    }
    
    func stopAnimating() {
        nvActivityIndicatorView.stopAnimating()
        alpha = 0
        resignFirstResponder()
    }
    
}


extension PeekActivityLoaderView {
    enum Constants {
        static let nvActivityIndicatorViewSize: CGFloat = 100
        static let nvActivityIndicatorViewFrame: CGRect = .init(origin: .zero, size: .init(width: nvActivityIndicatorViewSize, height: nvActivityIndicatorViewSize))
    }
}
