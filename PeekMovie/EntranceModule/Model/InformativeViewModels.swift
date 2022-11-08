//
//  InformativeViewModels.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 07.11.2022.
//

import UIKit


enum InformativeType {
    case detail, tip, header, wrong, correct
}

enum IncorrectInput {
    case username, password, email, roomId
}

enum InfoPopType {
    case incorrectInput(input: IncorrectInput)
    case userJoin(username: String), userLeft(username: String), adminOut, roomStart
    case connectionError, serverError, internalError, unknown
}

protocol Informatives: Colors, Fonts {
    func getTipLabel(with text: String, detail: String, labelType: InformativeType) -> UILabel
    func getInfoPop() -> UILabel
    func getActivityIndicator() -> UIActivityIndicatorView
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
    
    func animateInfoPop(label l: UILabel, completion: @escaping () -> Void = {}) {
        let initialCenter = l.center
        UIView.animate(withDuration: 0.8, delay: 0, options: [.curveEaseInOut]) {
            l.center = CGPoint(x: initialCenter.x, y: 80)
        } completion: { done in
            UIView.animate(withDuration: 0.8, delay: 3, options: [.curveEaseInOut]) {
                l.center = initialCenter
            } completion: { _ in
                completion()
            }
        }
    }
    
    func getActivityIndicator() -> UIActivityIndicatorView {
        let i = UIActivityIndicatorView()
        i.color = yellow
        i.hidesWhenStopped = true
        i.frame.size = CGSize(width: 20, height: 20)
        i.center = CGPoint(x: UIScreen.main.bounds.width / 2, y: 80)
        return i
    }
}
