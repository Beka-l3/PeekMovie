//
//  MovieCollectionCell.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 22.11.2022.
//

import UIKit

class MovieCollectionCell: UICollectionViewCell, ColorsOld, Informatives, FadingLayers {
    static let identifier = "CellId"
    
    private lazy var activityIndicator: UIActivityIndicatorView = { getActivityIndicator() }()
    private lazy var bottomFade: CAGradientLayer = {getFadingLayer2(from: .bottom, locations: [0.75, 0.95], color: .black, zPos: -1)}()
    private lazy var imageView: UIImageView = {
        let i = UIImageView()
        i.backgroundColor = clearBlack
        i.contentMode = .scaleToFill
        i.clipsToBounds = true
        i.layer.zPosition = -2
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }()
    private lazy var ratingLabel: UILabel = { getTipLabel(with: "0.0") }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        layer.cornerRadius = EPConstants.smallPadding
        layer.borderColor = yellow.cgColor
        layer.borderWidth = 1
        clipsToBounds = true
        
        addSubview(imageView)
        addSubview(ratingLabel)
        addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            ratingLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -EPConstants.smallPadding / 2),
            ratingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -EPConstants.smallPadding / 2),
        ])
        
        layer.addSublayer(bottomFade)
        bottomFade.frame.origin = .zero
        bottomFade.frame.size = frame.size
        
        activityIndicator.center = center
    }; required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
//    override func layoutSubviews() { super.layoutSubviews()
//        bottomFade.frame = frame
//    }
    
    func setData(movie: MovieDTO) {
        changeActivityIndicatorState(toActive: true)
        ratingLabel.text = "\(movie.rating)"
        getData(from: URL(string: movie.url)!) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                if let image = UIImage(data: data) {
                    self?.imageView.image = image
                    self?.layer.borderWidth = 0
                } else {
                    self?.layer.borderWidth = 1
                    self?.imageView.backgroundColor = self?.clearBlack
                }
            }
        }
        changeActivityIndicatorState(toActive: false)
    }
    
    func changeActivityIndicatorState(toActive: Bool) {
        if toActive { activityIndicator.startAnimating() }
        else { activityIndicator.stopAnimating() }
    }
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
