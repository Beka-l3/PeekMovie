//
//  WaitingRoomViewModels.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.10.2022.
//

import UIKit


class WaitingRoomViewModels: Colors, Fonts, Interactives, Informatives {
    lazy var logoImage: UIImageView = {
        let i = UIImageView()
        i.image = EPConstants.logoImage
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    lazy var tipLabel: UILabel = {
        getTipLabel(with: EPConstants.waitingTipText)
    }()
    
    lazy var secondTipLabel: UILabel = {
        getTipLabel(with: EPConstants.waitingDetailText, labelType: .detail)
    }()
    
    lazy var roomIDTextLabel: UILabel = {
        getTipLabel(with: EPConstants.roomText, detail: EPConstants.idText, labelType: .header)
    }()
    
    lazy var roomIDLabel: UILabel = {
        let roomId = "roomid"
        return getTipLabel(with: roomId, detail: EPConstants.emptyText, labelType: .header)
    }()
    
    lazy var usersPickerView: UIPickerView = {
        let p = UIPickerView()
        p.backgroundColor = clearBlack
        p.layer.borderColor = semiYellow.cgColor
        p.layer.borderWidth = 1
        p.layer.cornerRadius = EPConstants.smallPadding
        p.translatesAutoresizingMaskIntoConstraints = false
        return p
    }()
    
    lazy var startButton: UIButton = {
        let b = getTeritaryButton(with: EPConstants.startButtonTitle, isBold: true)
        b.frame.size = EPConstants.startButtonSize
        b.layer.cornerRadius = EPConstants.startButtonSize.width / 2
        b.layer.zPosition = 1
        b.translatesAutoresizingMaskIntoConstraints = true
        return b
    }()
    
    lazy var secondLogoImage: UIImageView = {
        let i = UIImageView()
        i.image = EPConstants.logoImage
        i.frame.size = EPConstants.startButtonSize
        i.layer.cornerRadius = EPConstants.startButtonSize.width / 2
        i.clipsToBounds = true
        i.layer.zPosition = 1
//        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    lazy var cancelButton: UIButton = {
        getSecondaryButton(with: EPConstants.cancelButtonTitle)
    }()
    
    lazy var circles: [UIView] = {
        let c = [
            getCircle(zPos: -1),
            getCircle(zPos: -2),
            getCircle(zPos: -3)
        ]
        return c
    }()
    
    lazy var waitingView: UIView = {
        let v = UIView()
        
        v.addSubview(logoImage)
        v.addSubview(tipLabel)
        v.addSubview(secondTipLabel)
        v.addSubview(roomIDTextLabel)
        v.addSubview(roomIDLabel)
        v.addSubview(cancelButton)
        v.addSubview(circles[0])
        v.addSubview(circles[1])
        v.addSubview(circles[2])
        v.addSubview(startButton)
        v.addSubview(secondLogoImage)
        v.addSubview(usersPickerView)
        
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: v.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: v.topAnchor),
            logoImage.widthAnchor.constraint(equalToConstant: EPConstants.smallLogoSize.width),
            logoImage.heightAnchor.constraint(equalToConstant: EPConstants.smallLogoSize.height),
            
            tipLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: EPConstants.padding),
            tipLabel.centerXAnchor.constraint(equalTo: v.centerXAnchor),
            
            secondTipLabel.topAnchor.constraint(equalTo: tipLabel.bottomAnchor, constant: EPConstants.smallPadding),
            secondTipLabel.centerXAnchor.constraint(equalTo: v.centerXAnchor),
            
            roomIDTextLabel.topAnchor.constraint(equalTo: secondTipLabel.bottomAnchor, constant: EPConstants.padding),
            roomIDTextLabel.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            
            roomIDLabel.centerYAnchor.constraint(equalTo: roomIDTextLabel.centerYAnchor),
            roomIDLabel.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            
            usersPickerView.topAnchor.constraint(equalTo: roomIDLabel.bottomAnchor, constant: EPConstants.smallPadding),
            usersPickerView.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            usersPickerView.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            
            cancelButton.bottomAnchor.constraint(equalTo: v.bottomAnchor),
            cancelButton.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            cancelButton.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            cancelButton.heightAnchor.constraint(equalToConstant: EPConstants.interactiveSize.height),
        ])
        
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    func getCircle(zPos: CGFloat, opacity: Float = 1) -> UIView {
        let v = UIView()
        let size: CGSize
        switch zPos {
            case -1: size = EPConstants.innerCircleSize
            case -2: size = EPConstants.middleCircleSize
            default: size = EPConstants.outerCircleSize
        }
        let radius = size.width / 2
        
        v.frame.size = size
        v.center = .zero
        v.layer.zPosition = zPos
        v.layer.cornerRadius = radius
        v.backgroundColor = .clear
        v.layer.borderWidth = 0
        v.layer.borderColor = yellow.cgColor
        v.layer.opacity = opacity
        return v
    }
    
    func setCenterForStartButton(at center: CGPoint) {
        circles[0].center = center
        circles[1].center = center
        circles[2].center = center
        startButton.center = CGPoint(x: center.x, y: center.y)
        secondLogoImage.center = CGPoint(x: center.x, y: center.y)
        usersPickerView.heightAnchor.constraint(equalToConstant: center.y/2).isActive = true
    }
    
    func startAnimation() {
        expandStroke()
    }
}
