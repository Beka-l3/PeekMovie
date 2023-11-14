//
//  PeekBottomSheetDraggerView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 14.11.2023.
//

import UIKit


final class PeekBottomSheetDraggerView: UIView {
    
    
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
    }
    
    
//    MARK: private func
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = Colors.backgroundPrimary
        layer.cornerRadius = Constants.height / 2
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: Constants.width),
            heightAnchor.constraint(equalToConstant: Constants.height),
        ])
    }
    
    
}


extension PeekBottomSheetDraggerView {
    enum Constants {
        static let width: CGFloat = 60
        static let height: CGFloat = 8
    }
}
