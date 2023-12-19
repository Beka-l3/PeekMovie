//
//  RootViewControllerViewComponents.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 02.11.2023.
//

import UIKit
import NVActivityIndicatorView


final class RootViewControllerViewComponents {
    
    lazy var background: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.backgroundPrimary
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var appTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.appTitle
        label.font = Fonts.bold24
        label.textColor = Colors.mainGradientFirst
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nvActivityIndicatorView: NVActivityIndicatorView = {
        let gradientColor = Colors.gradientColor(bounds: Constants.nvActivityIndicatorViewFrame, type: .main)
        let view = NVActivityIndicatorView(frame: Constants.nvActivityIndicatorViewFrame, type: .circleStrokeSpin, color: gradientColor)
        return view
    }()
    
    
    public func setupViews(parent: UIView) {
        parent.backgroundColor = Colors.backgroundPrimary
        
        parent.addSubview(background)
        parent.addSubview(appTitleLabel)
        parent.addSubview(nvActivityIndicatorView)
        
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: parent.topAnchor),
            background.leadingAnchor.constraint(equalTo: parent.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: parent.trailingAnchor),
            background.bottomAnchor.constraint(equalTo: parent.bottomAnchor),
            
            appTitleLabel.centerXAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerXAnchor),
            appTitleLabel.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.centerYAnchor, constant: Constants.appTitleLabelTopAnchorConstant),
        ])
    }
    
    public func setupFrames(parent: UIView) {
        nvActivityIndicatorView.center = parent.center
    }
}


extension RootViewControllerViewComponents {
    enum Constants {
        static let nvActivityIndicatorViewSize: CGFloat = 100
        static let nvActivityIndicatorViewFrame: CGRect = .init(origin: .zero, size: .init(width: 100, height: nvActivityIndicatorViewSize))
        
        static let appTitle = "Peek Movie"
        
        static let padding: CGFloat = 16
        
        static let appTitleLabelTopAnchorConstant: CGFloat = nvActivityIndicatorViewSize / 2 + padding
    }
}
