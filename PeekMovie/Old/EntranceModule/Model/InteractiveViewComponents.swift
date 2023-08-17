//
//  ViewModels.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 15.10.2022.
//
import UIKit

protocol Interactives: ColorsOld, FontsOld {
    func getFocusButton(with title: String) -> UIButton
    func getSecondaryButton(with title: String) -> UIButton
    func getTeritaryButton(with title: String, isBold: Bool) -> UIButton
    func getInputTextView(with placeholder: String) -> UITextField
}

extension Interactives {
    func getFocusButton(with title: String) -> UIButton {
        let b = UIButton(type: .system)
        b.setTitle(title, for: .normal)
        b.setTitleColor(black, for: .normal)
        b.backgroundColor = yellow
        b.titleLabel?.font = bodyFont
        b.layer.cornerRadius = IConstants.cornerRadius
        b.titleLabel?.layer.shadowColor = black.cgColor
        b.titleLabel?.layer.shadowOffset = IConstants.shadowOffset
        b.titleLabel?.layer.shadowOpacity = IConstants.shadowOpacityHalf
        b.titleLabel?.layer.shadowRadius = IConstants.shadowRadius
        b.layer.shadowColor = white.cgColor
        b.layer.shadowOffset = IConstants.shadowOffset
        b.layer.shadowOpacity = IConstants.shadowOpacity
        b.layer.shadowRadius = IConstants.shadowRadius
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }
    
    func getSecondaryButton(with title: String) -> UIButton {
        let b = UIButton(type: .system)
        b.setTitle(title, for: .normal)
        b.setTitleColor(white, for: .normal)
        b.backgroundColor = black
        b.titleLabel?.font = bodyFont
        b.layer.cornerRadius = IConstants.cornerRadius
        b.titleLabel?.layer.shadowColor = white.cgColor
        b.titleLabel?.layer.shadowOffset = IConstants.shadowOffset
        b.titleLabel?.layer.shadowOpacity = IConstants.shadowOpacityHalf
        b.titleLabel?.layer.shadowRadius = IConstants.shadowRadius
        b.layer.borderWidth = IConstants.borderWidth
        b.layer.borderColor = white.cgColor
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }
    
    func getTeritaryButton(with title: String, isBold: Bool = false) -> UIButton {
        let b = UIButton(type: .system)
        b.setTitle(title, for: .normal)
        b.setTitleColor(yellow, for: .normal)
        b.backgroundColor = black
        b.titleLabel?.font = isBold ? detailBoldFont : detailFont
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }
    
    func getInputTextView(with placeholder: String) -> UITextField {
        let i = UITextField()
        let placeholderText = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: grey])
        i.attributedPlaceholder = placeholderText
        i.backgroundColor = white
        i.font = bodyFont
        i.textColor = black
        i.textAlignment = .left
        
        i.setLeftPaddingPoints(IConstants.padding)
        i.setRightPaddingPoints(IConstants.padding)
        
        i.layer.cornerRadius = IConstants.cornerRadius
        i.layer.borderColor = grey.cgColor
        i.layer.borderWidth = IConstants.borderWidth
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }

}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: .zero, y: .zero, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: .zero, y: .zero, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

