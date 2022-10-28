//
//  PosterViewModels.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 25.10.2022.
//

import UIKit


final class PosterViewModels: Colors, Fonts, FadingLayers {
    
    lazy var movieInfoView: MoviewInfoScrollViewModel = { MoviewInfoScrollViewModel() }()
    lazy var darkFadeTop: CAGradientLayer = { getFadingLayer3(from: .top, locations: [0.1, 0.55, 1], color: .black) }()
    lazy var yellowFadeBottom: CAGradientLayer = { getFadingLayer3(locations: [0.1, 0.55, 1], color: .yellow) }()
    
    lazy var posterImage: UIImageView = {
        let i = UIImageView()
        i.contentMode = .scaleAspectFill
        return i
    }()
    
    lazy var infoButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("i", for: .normal)
        b.titleLabel?.font = .boldSystemFont(ofSize: 12)
        b.setTitleColor(black, for: .normal)
        b.backgroundColor = yellow
        b.layer.cornerRadius = 6
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    lazy var posterView: UIView = {
        let v = UIView()
        v.addSubview(posterImage)
        v.layer.addSublayer(yellowFadeBottom)
        v.addSubview(movieInfoView.infoView)
        v.layer.addSublayer(darkFadeTop)
        v.addSubview(infoButton)
        NSLayoutConstraint.activate([
            movieInfoView.infoView.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            movieInfoView.infoView.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            movieInfoView.infoView.bottomAnchor.constraint(equalTo: v.bottomAnchor),
            
            infoButton.widthAnchor.constraint(equalToConstant: 20),
            infoButton.heightAnchor.constraint(equalToConstant: 20),
            infoButton.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -16),
            infoButton.topAnchor.constraint(equalTo: v.topAnchor, constant: 16),
        ])
        v.backgroundColor = clearBlack
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    func setupLayers(size: CGSize) {
        darkFadeTop.frame.origin = .zero
        darkFadeTop.frame.size = CGSize(width: size.width, height: size.height * 0.2)
        
        let yellowFadeHeight = CGFloat(8)
        yellowFadeBottom.frame.size = CGSize(width: size.width, height: yellowFadeHeight)
        yellowFadeBottom.frame.origin = CGPoint(x: .zero, y: size.height - yellowFadeHeight)
        yellowFadeBottom.isHidden = true
        
        movieInfoView.infoView.heightAnchor.constraint(equalToConstant: size.height * 0.6).isActive = true
        movieInfoView.setupLayers(
            size: CGSize(width: size.width, height: size.height * 0.6),
            contentSize: CGSize(width: size.width, height: size.height * 1.2)
        )
    }
    
    func setData(frameSize: CGSize) {
        // MARK: FIX ME PLEASE
        let image = UIImage(named: "1917")!
        let scale = frameSize.height / image.size.height
        let newSize = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        
        posterImage.image = image
        posterImage.frame.origin = .zero
        posterImage.frame.size = newSize
    }
}
