//
//  MovieDetailScrollView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 26.10.2022.
//

import UIKit


class MoviewInfoScrollViewModel: Colors, FadingLayers {
    
    lazy var infoStackViewModel: MovieInfoStackViewModel = { MovieInfoStackViewModel() }()
    lazy var whiteFadeScrollBackground: CAGradientLayer = { getFadingLayer3(locations: [0.1, 0.2, 0.3]) }()
    lazy var maskLayerTop: CAGradientLayer = { getFadingLayer3(locations: [0.1, 0.2, 0.3], color: .black) }()
    
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
        let mask = getFadingLayer3(from: .left, locations: [0.8, 0.9, 1])
        mask.frame.origin = .zero
        mask.frame.size = CGSize(width: frameSize.width - 32 - 68, height: 42)
        infoStackViewModel.movieTitleView.layer.mask = mask
        
        print(frameSize.height)
        
        NSLayoutConstraint.activate([
            infoStackViewModel.movieYear.widthAnchor.constraint(equalToConstant: 60),
            infoStackViewModel.movieTitleView.widthAnchor.constraint(equalToConstant: frameSize.width - 32 - 68),
            infoStackViewModel.mainStackView.widthAnchor.constraint(equalToConstant: frameSize.width - 32),
            
            infoStackViewModel.mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: frameSize.height * 0.4),
            infoStackViewModel.mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: infoStackViewModel.mainStackView.bottomAnchor, constant: 32),
        ])

        whiteFadeScrollBackground.frame.origin = .zero
        whiteFadeScrollBackground.frame.size = CGSize(width: contentSize.width, height: contentSize.height * 1.25)
        
        maskLayerTop.frame.origin = .zero
        maskLayerTop.frame.size = CGSize(width: frameSize.width, height: frameSize.height)
    }
    
}
