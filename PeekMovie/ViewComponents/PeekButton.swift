//
//  MainButton.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 05.11.2023.
//

import UIKit


final class PeekButton: UIButton {
    
    enum ButtonType {
        case main
        case secondary
        case tertiary
    }
    
    let peekButtonType: ButtonType
    private(set) var titleText: String
    
    lazy var underlineView: UIView = {
        let view = UIView()
        view.layer.zPosition = Constants.underlineZPosition
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var underlineTopAnchorConstraint: NSLayoutConstraint?
    
    
//    MARK: lifecycle
    init(type: ButtonType, titleText: String) {
        self.peekButtonType = type
        self.titleText = titleText
        super.init(frame: .zero)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        self.peekButtonType = .main
        self.titleText = Constants.defaultTitleText
        super.init(coder: coder)
    }
    
    convenience init(type: ButtonType, titleText: String, target: Any?, action: Selector) {
        self.init(type: type, titleText: titleText)
        
        addTarget(target, action: action, for: .touchUpInside)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupTitleGradientColorIfNeeded()
    }
    
    
//    MARK: exposed func
    public func setupTitleGradientColorIfNeeded() {
        guard bounds.size != .zero, let gradientColor = Colors.gradientColor(bounds: bounds, type: .main) else {
            return
        }
        
        switch peekButtonType {
            
        case .main:
            setTitleColor(gradientColor, for: .normal)
            
        case .secondary:
            setTitleColor(gradientColor, for: .normal)
            underlineTopAnchorConstraint?.constant = -Constants.underlineTopAnchorConstantSecondary
            
        case .tertiary:
            underlineTopAnchorConstraint?.constant = -Constants.underlineTopAnchorConstantTertiary
            
        }
    }
    
    
//    MARK: private func
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = Colors.clearBlack
        setTitle(titleText, for: .normal)
        contentHorizontalAlignment = .leading
        
        switch peekButtonType {
        case .main:
            setTitleColor(Colors.mainGradientFirst, for: .normal)
            titleLabel?.font = Fonts.bold18
            underlineView.isHidden = true

        case .secondary:
            setTitleColor(Colors.mainGradientFirst, for: .normal)
            titleLabel?.font = Fonts.bold14
            underlineView.isHidden = false
            underlineView.backgroundColor = Colors.mainGradientFirst
            underlineView.layer.opacity = Constants.underlineOpacity

        case .tertiary:
            setTitleColor(Colors.textTertiaryOpaque, for: .normal)
            titleLabel?.font = Fonts.regular12
            underlineView.isHidden = false
            underlineView.backgroundColor = Colors.textTertiaryOpaque
            underlineView.layer.opacity = Constants.underlineOpacity
        }
        
        if let titleLabel = titleLabel {
            addSubview(underlineView)
            NSLayoutConstraint.activate([
                underlineView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
                underlineView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
                underlineView.heightAnchor.constraint(equalToConstant: Constants.underlineHeight),
            ])
            
            underlineTopAnchorConstraint = underlineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor)
            underlineTopAnchorConstraint?.isActive = true
        }
    }
}


extension PeekButton {
    private func getTitleAttributes(font: UIFont?, color: UIColor?) -> [NSAttributedString.Key: Any]? {
        guard let font = font, let color = color else {
            return nil
        }
        
        return [
            .font: font,
            .foregroundColor: color,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
    }
    
    private func getAttributeString(titleText: String, font: UIFont?, color: UIColor?) -> NSMutableAttributedString? {
        guard let titleAttributes = getTitleAttributes(font: font, color: color) else {
            return nil
        }
        
        return NSMutableAttributedString(
            string: titleText,
            attributes: titleAttributes
        )
    }
}


extension PeekButton {
    enum Constants {
        static let defaultTitleText = "Peek Button"
        static let underlineHeight: CGFloat = 1
        static let underlineTopAnchorConstantSecondary: CGFloat = 4
        static let underlineTopAnchorConstantTertiary: CGFloat = 4
        static let underlineOpacity: Float = 0.6
        static let underlineZPosition: CGFloat = -10
    }
}
