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
        b.frame = CGRect(x: 300, y: 500, width: 20, height: 20)
        b.setTitle("i", for: .normal)
        b.titleLabel?.font = .boldSystemFont(ofSize: 12)
        b.setTitleColor(black, for: .normal)
        b.backgroundColor = yellow
        b.layer.cornerRadius = 6
        return b
    }()
    
    lazy var posterView: UIView = {
        let v = UIView()
        
        v.addSubview(posterImage)
        v.addSubview(movieInfoView.infoView)
        NSLayoutConstraint.activate([
            movieInfoView.infoView.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            movieInfoView.infoView.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            movieInfoView.infoView.bottomAnchor.constraint(equalTo: v.bottomAnchor),
        ])
        
        v.layer.addSublayer(darkFadeTop)
        
        v.backgroundColor = clearBlack
        v.clipsToBounds = true
        v.layer.cornerRadius = 32
        v.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    func setupLayers(size: CGSize) {
        let darkFadeTopSize = CGSize(width: size.width, height: size.height * 0.2)
        darkFadeTop.frame.origin = .zero
        darkFadeTop.frame.size = darkFadeTopSize
        
        movieInfoView.infoView.heightAnchor.constraint(equalToConstant: size.height * 0.6).isActive = true
        movieInfoView.setupLayers(
            frameSize: CGSize(width: size.width, height: size.height * 0.6),
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
