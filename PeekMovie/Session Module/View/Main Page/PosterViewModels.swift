//
//  PosterViewModels.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 25.10.2022.
//

import UIKit


final class PosterViewModels: Colors, Fonts, MovieInfoViews, FadingLayers {
    lazy var movieRatingLabel: UILabel = { getLabel(font: titleFont, text: "0.0", color: yellow) }()
    lazy var movieInfoView: MoviewInfoScrollViewModel = { MoviewInfoScrollViewModel() }()
    lazy var darkFadeTop: CAGradientLayer = { getFadingLayer3(from: .top, locations: [0.1, 0.55, 1], color: .black) }()
    lazy var yellowFadeBottom: CAGradientLayer = { getFadingLayer3(locations: [0.1, 0.55, 1], color: .yellow) }()
    lazy var likeFade: CAGradientLayer = { getFadingLayer2(from: .right, locations: [0, 1], color: .yellow) }()
    lazy var disLikeFade: CAGradientLayer = { getFadingLayer2(from: .left, locations: [0, 1], color: .black) }()
    lazy var likeLabel: UILabel = { getLabel(font: largeTitleFont, text: "Like", color: black) }()
    lazy var disLikeLabel: UILabel = { getLabel(font: largeTitleFont, text: "disLike", color: semiWhite) }()
    lazy var receiver: UIView = { UIView() }()
    lazy var posterImage: UIImageView = {
        let i = UIImageView()
        i.frame.origin = .zero
        i.backgroundColor = black
        i.contentMode = .scaleAspectFill
        receiver.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    
    lazy var infoButton: UIButton = {
        let b = UIButton(type: .system)
        b.setTitle("H", for: .normal)
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
        v.addSubview(receiver)
        v.layer.addSublayer(yellowFadeBottom)
        v.addSubview(movieInfoView.infoView)
        v.layer.addSublayer(darkFadeTop)
        v.addSubview(movieRatingLabel)
        v.addSubview(infoButton)
        v.layer.addSublayer(likeFade)
        v.layer.addSublayer(disLikeFade)
        v.addSubview(likeLabel)
        v.addSubview(disLikeLabel)
        NSLayoutConstraint.activate([
            movieRatingLabel.topAnchor.constraint(equalTo: v.topAnchor, constant: 16),
            movieRatingLabel.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 16),
            receiver.topAnchor.constraint(equalTo: v.topAnchor),
            receiver.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            receiver.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            receiver.bottomAnchor.constraint(equalTo: v.bottomAnchor),
            movieInfoView.infoView.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            movieInfoView.infoView.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            movieInfoView.infoView.bottomAnchor.constraint(equalTo: v.bottomAnchor),
            infoButton.widthAnchor.constraint(equalToConstant: 20),
            infoButton.heightAnchor.constraint(equalToConstant: 20),
            infoButton.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -16),
            infoButton.topAnchor.constraint(equalTo: v.topAnchor, constant: 16),
            likeLabel.centerXAnchor.constraint(equalTo: v.centerXAnchor),
            likeLabel.centerYAnchor.constraint(equalTo: v.centerYAnchor),
            disLikeLabel.centerXAnchor.constraint(equalTo: v.centerXAnchor),
            disLikeLabel.centerYAnchor.constraint(equalTo: v.centerYAnchor),
        ])
        v.backgroundColor = clearBlack
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    func setupLayers(size: CGSize) {
        likeLabel.layer.opacity = 0
        disLikeLabel.layer.opacity = 0
        darkFadeTop.frame.origin = .zero
        darkFadeTop.frame.size = CGSize(width: size.width, height: 50)
        likeFade.frame.origin = CGPoint(x: size.width, y: 0)
        likeFade.frame.size = size
        disLikeFade.frame.origin = CGPoint(x: -size.width, y: 0)
        disLikeFade.frame.size = size
        
        let yellowFadeHeight = CGFloat(8)
        yellowFadeBottom.frame.size = CGSize(width: size.width, height: yellowFadeHeight)
        yellowFadeBottom.frame.origin = CGPoint(x: .zero, y: size.height - yellowFadeHeight)
        yellowFadeBottom.isHidden = true
        movieInfoView.infoView.heightAnchor.constraint(equalToConstant: size.height * 0.4).isActive = true
        movieInfoView.setupLayers(
            size: CGSize(width: size.width, height: size.height * 0.4),
            contentSize: CGSize(width: size.width, height: size.height * 0.8)
        )
    }
    
    func setData(size: CGSize, movie: MovieDTO) {
        movieInfoView.infoStackViewModel.setData(movie: movie)
        
        UIView.transition(with: movieRatingLabel, duration: 0.8, options: .transitionCrossDissolve) { [weak self] in self?.movieRatingLabel.text = String(movie.rating) }
        UIView.transition(with: posterImage, duration: 0.8, options: .transitionCrossDissolve) { [weak self] in self?.posterImage.image = nil }
    }
    
    func setPosterImage(img: UIImage) {
        UIView.transition(with: posterImage, duration: 0.8, options: .transitionCrossDissolve) { [weak self] in
            self?.posterImage.image = img
        }
    }
    
    func animatePosterImage(size: CGSize, isNew: Bool = false) {
        guard let image = posterImage.image else {return}
        let scale = size.height / image.size.height
        let newSize = CGSize(width: image.size.width * scale, height: image.size.height * scale)
        if isNew { posterImage.frame.origin = .zero }
        posterImage.frame.size = newSize
        
        var offset: CGFloat = .zero
        if posterImage.frame.origin == .zero { offset = newSize.width - size.width }
        let newOrigin = CGPoint(x: -offset, y: .zero)
        
        UIView.animate(withDuration: 12, delay: 1, options: [.repeat, .autoreverse]) { [weak self] in
            self?.posterImage.frame.origin = newOrigin
        }
    }
}
