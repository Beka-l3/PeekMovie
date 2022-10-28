//
//  MovieInfoStackView.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 26.10.2022.
//

import UIKit


class MovieInfoStackViewModel: Colors, FadingLayers, MovieInfoViews {
    // MARK: PLEASE FIX ME
    lazy var movieTitleLabel: UILabel = { getLabel(ofSize: 32, text: "Movie title: additional informative title") }()
    lazy var movieYear: UILabel = { getLabel(ofSize: 24, text: "2019") }()
    
    lazy var movieTitleScrollView: UIScrollView = {
        let s = UIScrollView()
        movieYear.textAlignment = .right
        s.addSubview(movieTitleLabel)
        s.showsHorizontalScrollIndicator = false
        NSLayoutConstraint.activate([
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
    
    lazy var directorLabel: UILabel = { getLabel(ofSize: 20, text: "Director") }()
    lazy var directorNameLabel: UILabel = { getLabel(ofSize: 20, text: "Direcor's name") }()
    lazy var director: UIStackView = { getStack(views: [directorLabel, directorNameLabel], isEqual: true) }()
    
    lazy var countryLabel: UILabel = { getLabel(ofSize: 20, text: "Country") }()
    lazy var countryNameLabel: UILabel = { getLabel(ofSize: 20, text: "Kazakhstan") }()
    lazy var country: UIStackView = { getStack(views: [countryLabel, countryNameLabel], isEqual: true) }()
    
    lazy var description: UILabel = {getLabel(ofSize: 16, text: "Two soldiers, assigned the task of delivering a critical message to another battalion, risk their lives for the job in order to prevent them from stepping right into a deadly ambush.\n\nApril 6th, 1917. As an infantry battalion assembles to wage war deep in enemy territory, two soldiers are assigned to race against time and deliver a message that will stop 1,600 men from walking straight into a deadly trap.", lines: .zero)  }()
    
    lazy var mainStackView: UIStackView = {
        getStack(views: [titleAndYear, director, country, description], axis: .vertical, spacing: 16)
    }()
    
}
