//
//  MovieDetailScrollView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 26.10.2022.
//

import UIKit


class MoviewInfoScrollViewModel: ColorsOld, FadingLayers {
    
    lazy var infoStackViewModel: MovieInfoStackViewModel = { MovieInfoStackViewModel() }()
    lazy var whiteFadeScrollBackground: CAGradientLayer = { getFadingLayer3(locations: [0.05, 0.15, 0.4], color: .black) }()
    lazy var maskLayerTop: CAGradientLayer = { getFadingLayer2(locations: [0, 0.1], color: .black) }()
    
    lazy var scrollView: UIScrollView = {
        let s = UIScrollView()
        s.layer.addSublayer(whiteFadeScrollBackground)
        s.addSubview(infoStackViewModel.mainStackView)
        s.showsVerticalScrollIndicator = false
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
    
    func setupLayers(size: CGSize, contentSize: CGSize) {
        NSLayoutConstraint.activate([
            infoStackViewModel.mainStackView.widthAnchor.constraint(equalToConstant: size.width - 32),
            infoStackViewModel.mainStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: size.height * 0.2),
            infoStackViewModel.mainStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            scrollView.contentLayoutGuide.bottomAnchor.constraint(equalTo: infoStackViewModel.mainStackView.bottomAnchor, constant: 32),
        ])

        whiteFadeScrollBackground.frame.origin = .zero
        whiteFadeScrollBackground.frame.size = CGSize(width: contentSize.width, height: contentSize.height * 1.25)
        
        maskLayerTop.frame.origin = .zero
        maskLayerTop.frame.size = size
        
        infoStackViewModel.setupLayers(size: size)
    }
}
