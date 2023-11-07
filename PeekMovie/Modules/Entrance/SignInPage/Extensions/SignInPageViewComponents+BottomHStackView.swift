//
//  SignInPage+BottomHStackView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 07.11.2023.
//

import UIKit


extension SignInPageViewComponents {
    func getBottomHStackView(with arrangedSubviews: [UIView]) -> UIStackView {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = Constants.paddingXXS
        view.backgroundColor = Colors.clearBlack
        
        for subview in arrangedSubviews {
            view.addArrangedSubview(subview)
        }
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
}
