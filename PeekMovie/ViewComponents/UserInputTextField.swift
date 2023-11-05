//
//  UserInputTextField.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 05.11.2023.
//

import UIKit


final class UserInputTextField: UITextField {
    
    private lazy var bottomBorderLine: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.textTertiary
        view.translatesAutoresizingMaskIntoConstraints = false
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
        setupLayers()
    }
    
    
//    MARK: exposed func
    public func setPlaceholder(_ placeholder: String) {
        if let font = Fonts.light12 {
            attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [
                .foregroundColor: Colors.textTertiary,
                .font: font
            ])
        }
    }
    
    
//    MARK: private func
    private func setupView() {
        backgroundColor = Colors.clearBlack
        font = Fonts.regular14
        textColor = Colors.textMain
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayers() {
        addSubview(bottomBorderLine)
        
        NSLayoutConstraint.activate([
            bottomBorderLine.heightAnchor.constraint(equalToConstant: Constants.bottomBorderLineHeight),
            bottomBorderLine.widthAnchor.constraint(equalTo: widthAnchor),
            bottomBorderLine.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomBorderLine.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
}



extension UserInputTextField {
    private enum Constants {
        static let bottomBorderLineHeight: CGFloat = 1
    }
}
