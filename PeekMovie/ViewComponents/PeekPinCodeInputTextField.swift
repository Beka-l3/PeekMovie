//
//  PeekPinCodeInputTextField.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 04.12.2023.
//

import UIKit


final class PeekPinCodeInputTextField: UITextField {
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.underlineViewCornerRadius
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var isFilled: Bool = false
    
    
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
        setUnderlineViewColor()
    }
    
    
//    MARK: exposed func
    func filled() {
        underlineView.alpha = Constants.underlineViewFullAlpha
        isFilled = true
    }
    
    func empty() {
        underlineView.alpha = Constants.underlineViewEmptyAlpha
        isFilled = false
    }
    
    
//    MARK: private func
    private func setupView() {
        backgroundColor = Colors.backgroundPrimary
        font = Constants.font
        textColor = Colors.textMain
        
        addSubview(underlineView)
        
        NSLayoutConstraint.activate([
            underlineView.heightAnchor.constraint(equalToConstant: Constants.underlineViewHeight),
            underlineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.underlinePadding),
            underlineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.underlinePadding),
            underlineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.underlinePadding),
        ])
    }
    
    private func setUnderlineViewColor() {
        guard underlineView.bounds.size != .zero, let gradientColor = Colors.gradientColor(bounds: bounds, type: .main) else {
            return
        }
        
        underlineView.backgroundColor = gradientColor
        
        isFilled ? filled() : empty()
    }
}


extension PeekPinCodeInputTextField {
    
    enum Constants {
        
        static let font: UIFont? = Fonts.medium48
        
        static let underlineViewHeight: CGFloat = 4
        static let underlineViewCornerRadius: CGFloat = 1
        static let underlineViewFullAlpha: CGFloat = 1
        static let underlineViewEmptyAlpha: CGFloat = 0.3
        
        static let underlinePadding: CGFloat = 4
    }
    
}

