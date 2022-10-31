//
//  MovieInfoStackView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 26.10.2022.
//

import UIKit


class MovieInfoStackViewModel: Fonts, Colors, FadingLayers, MovieInfoViews {
    // MARK: PLEASE FIX ME
    lazy var movieTitleLabel: UILabel = { getLabel(font: titleFont, text: "Movie title: additional informative title") }()
    lazy var movieTitleMask: CAGradientLayer = { getFadingLayer3(from: .left, locations: [0.8, 0.9, 1]) }()
    lazy var movieYear: UILabel = { getLabel(font: headerFont, text: "0000") }()
    
    lazy var movieTitleScrollView: UIScrollView = {
        let s = UIScrollView()
        movieYear.textAlignment = .right
        s.addSubview(movieTitleLabel)
        s.showsHorizontalScrollIndicator = false
        NSLayoutConstraint.activate([
            movieYear.widthAnchor.constraint(equalToConstant: 60),
            movieTitleLabel.topAnchor.constraint(equalTo: s.topAnchor),
            movieTitleLabel.leadingAnchor.constraint(equalTo: s.leadingAnchor),
            s.contentLayoutGuide.trailingAnchor.constraint(equalTo: movieTitleLabel.trailingAnchor, constant: 42),
        ])
        s.translatesAutoresizingMaskIntoConstraints = false
        return s
    }()
    
    lazy var movieTitleView: UIView = {
        let v = UIView()
        
        v.addSubview(movieTitleScrollView)
        NSLayoutConstraint.activate([
            v.heightAnchor.constraint(equalToConstant: 42),
            movieTitleScrollView.topAnchor.constraint(equalTo: v.topAnchor),
            movieTitleScrollView.leadingAnchor.constraint(equalTo: v.leadingAnchor),
            movieTitleScrollView.trailingAnchor.constraint(equalTo: v.trailingAnchor),
            movieTitleScrollView.bottomAnchor.constraint(equalTo: v.bottomAnchor),
        ])
        
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    lazy var titleAndYear: UIStackView = { getStack(views: [movieTitleView, movieYear]) }()
    
    lazy var directorLabel: UILabel = { getLabel(font: bodyFont, text: "Director") }()
    lazy var directorNameLabel: UILabel = { getLabel(font: bodyFont, text: "Direcor's name") }()
    lazy var director: UIStackView = { getStack(views: [directorLabel, directorNameLabel], isEqual: true) }()
    
    lazy var countryLabel: UILabel = { getLabel(font: bodyFont, text: "Country") }()
    lazy var countryNameLabel: UILabel = { getLabel(font: bodyFont, text: "Kazakhstan") }()
    lazy var country: UIStackView = { getStack(views: [countryLabel, countryNameLabel], isEqual: true) }()
    
    lazy var description: UILabel = { getLabel(font: descriptionFont, text: "Movie description", lines: .zero)  }()
    
    lazy var mainStackView: UIStackView = {
        getStack(views: [titleAndYear, director, country, description], axis: .vertical, spacing: 16)
    }()
    
    func setupLayers(size: CGSize) {
        movieTitleMask.frame.origin = .zero
        movieTitleMask.frame.size = CGSize(width: size.width - 32 - 68, height: 42)
        movieTitleView.layer.mask = movieTitleMask
    }
    
    func setData(movie: Movie) {
        UIView.transition(with: movieTitleLabel, duration: 0.8, options: .transitionCrossDissolve) { [weak self] in self?.movieTitleLabel.text = movie.title }
        UIView.transition(with: movieYear, duration: 0.8, options: .transitionCrossDissolve) { [weak self] in self?.movieYear.text = String(movie.year) }
        UIView.transition(with: directorNameLabel, duration: 0.8, options: .transitionCrossDissolve) { [weak self] in self?.directorNameLabel.text = movie.prod }
        UIView.transition(with: description, duration: 0.8, options: .transitionCrossDissolve) { [weak self] in self?.description.text = movie.summary }
    }
}
