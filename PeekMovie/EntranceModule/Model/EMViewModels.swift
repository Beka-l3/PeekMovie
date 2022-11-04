//
//  ViewModels.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 15.10.2022.
//
import UIKit

protocol Interactives: Colors, Fonts {
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

enum InformativeType {
    case detail, tip, header, wrong, correct
}

enum InfoPopType {
    case incorrectInput, adminOut, roomStart, internetConnectionIssue, unknown
}

protocol Informatives: Colors, Fonts {
    func getTipLabel(with text: String, detail: String, labelType: InformativeType) -> UILabel
    func getInfoPop() -> UILabel
}

extension Informatives {
    func getTipLabel(with text: String, detail: String = EPConstants.emptyText, labelType: InformativeType = .tip) -> UILabel {
        let l = UILabel()
        var font: UIFont
        var color: UIColor = white
        switch labelType {
        case .detail:
            font = detailFont
            color = semiWhite
        case .tip:
            font = tipFont
        case .header:
            font = headerFont
        default:
            font = tipFont
        }
        
        let str = text + detail
        let myMutableString = NSMutableAttributedString(
            string: str,
            attributes: [
                NSAttributedString.Key.foregroundColor: color,
                NSAttributedString.Key.font : font
            ]
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: yellow,
            range: NSRange(
                location: str.count - detail.count,
                length:detail.count
            )
        )
        l.numberOfLines = .zero
        l.textAlignment = .center
        l.attributedText = myMutableString
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }
    
    func getInfoPop() -> UILabel {
        let l = UILabel()
        l.frame.size = CGSize(width: 180, height: 50)
        l.backgroundColor = darkGrey
        l.layer.cornerRadius = 25
        l.clipsToBounds = true
        l.layer.borderColor = semiGrey.cgColor
        l.layer.borderWidth = 1
        l.numberOfLines = .zero
        l.textAlignment = .center
        
        return l
    }
    
    func getAttributedText(text: String, detail: String, type: InformativeType = .tip) -> NSAttributedString {
        var color: UIColor = yellow
        if type == .correct { color = .systemGreen }
        if type == .wrong { color = .systemRed }
        
        let str = "\(text)\n\(detail)"
        let myMutableString = NSMutableAttributedString(
            string: str,
            attributes: [
                NSAttributedString.Key.foregroundColor: color,
                NSAttributedString.Key.font : infoBoldFont
            ]
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.foregroundColor,
            value: grey,
            range: NSRange(
                location: str.count - detail.count,
                length:detail.count
            )
        )
        myMutableString.addAttribute(
            NSAttributedString.Key.font,
            value: infoFont,
            range: NSRange(
                location: str.count - detail.count,
                length:detail.count
            )
        )
        
        return myMutableString
    }
    
    func animateInfoPop(label l: UILabel) {
        let initialCenter = l.center
        UIView.animate(withDuration: 0.8, delay: 0, options: [.curveEaseInOut]) {
            l.center = CGPoint(x: initialCenter.x, y: 80)
        } completion: { done in
            UIView.animate(withDuration: 0.8, delay: 3, options: [.curveEaseInOut]) {
                l.center = initialCenter
            }
        }
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


