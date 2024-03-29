//
//  PeekPinCodeDigitLabel.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 06.12.2023.
//

import UIKit


final class PeekPinCodeDigitLabel: UILabel {
    
    private lazy var underlineView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = Constants.underlineViewCornerRadius
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var isFilled: Bool = false
    
        
//    MARK: lifecycle
    init(with tag: Int) {
        super.init(frame: .zero)
        
        self.tag = tag
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
    func fill(with digitString: String) {
        text = digitString
        underlineView.alpha = Constants.underlineViewFullAlpha
        isFilled = true
    }
    
    func empty() {
        text = ""
        underlineView.alpha = Constants.underlineViewEmptyAlpha
        isFilled = false
    }
    
    
//    MARK: private func
    private func setupView() {
        backgroundColor = Colors.backgroundSecondary?.withAlphaComponent(Constants.underlineViewEmptyAlpha)
        font = Constants.font
        textColor = Colors.textMain
        layer.cornerRadius = Constants.cornerRadius
        textAlignment = .center
        tintColor = Colors.backgroundTertiary
        
        addSubview(underlineView)
        
        NSLayoutConstraint.activate([
            underlineView.heightAnchor.constraint(equalToConstant: Constants.underlineViewHeight),
            underlineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.underlinePadding),
            underlineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.underlinePadding),
            underlineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constants.underlinePadding),
        ])
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setUnderlineViewColor() {
        guard underlineView.bounds.size != .zero, let gradientColor = Colors.gradientColor(bounds: bounds, type: .main) else {
            return
        }
        
        underlineView.backgroundColor = gradientColor
        
        if let text = text, isFilled {
            fill(with: text)
        } else {
            empty()
        }
    }
}


extension PeekPinCodeDigitLabel {
    
    enum Constants {
        static let font: UIFont? = Fonts.regular34
        
        static let underlineViewHeight: CGFloat = 5
        static let underlineViewCornerRadius: CGFloat = 2
        
        static let underlineViewFullAlpha: CGFloat = 1
        static let underlineViewEmptyAlpha: CGFloat = 0.38
        
        static let underlinePadding: CGFloat = 4
        static let cornerRadius: CGFloat = 8
    }
}
