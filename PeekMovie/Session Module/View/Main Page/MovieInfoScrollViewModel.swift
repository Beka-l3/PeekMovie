//
//  MovieDetailScrollView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 26.10.2022.
//

import UIKit


class MoviewInfoScrollViewModel: Colors, FadingLayers {
    
    lazy var infoStackViewModel: MovieInfoStackViewModel = { MovieInfoStackViewModel() }()
    lazy var whiteFadeScrollBackground: CAGradientLayer = { getFadingLayer3(locations: [0.1, 0.25, 0.5]) }()
    lazy var whiteFadeBackground: CAGradientLayer = { getFadingLayer3(locations: [0.4, 0.5, 0.6], zPos: -5) }()
    lazy var maskLayerTop: CAGradientLayer = { getFadingLayer3(locations: [0, 0.15, 0.3], color: .black) }()
    
    lazy var scrollView: UIScrollView = {
        let s = UIScrollView()

        s.layer.addSublayer(whiteFadeScrollBackground)
        s.addSubview(infoStackViewModel.mainStackView)
        
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    lazy var infoView: UIView = {
        let v = UIView()
        v.layer.mask = maskLayerTop
        v.layer.addSublayer(whiteFadeBackground)
        
        v.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: v.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: v.bottomAnchor),
        ])
        
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    func setupLayers(frameSize: CGSize, contentSize: CGSize) {
        NSLayoutConstraint.activate([
            infoStackViewModel.mainStackView.widthAnchor.constraint(equalToConstant: frameSize.width - 32),
            infoStackViewModel.mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 220),
            infoStackViewModel.mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: infoStackViewModel.mainStackView.bottomAnchor, constant: 32),
        ])
        
//        scrollView.contentSize = contentSize
        
        whiteFadeScrollBackground.frame.origin = .zero
        whiteFadeScrollBackground.frame.size = contentSize
        
        whiteFadeBackground.frame.origin = .zero
        whiteFadeBackground.frame.size = frameSize
        
        maskLayerTop.frame.origin = .zero
        maskLayerTop.frame.size = CGSize(width: frameSize.width, height: frameSize.height)
    }
    
}
