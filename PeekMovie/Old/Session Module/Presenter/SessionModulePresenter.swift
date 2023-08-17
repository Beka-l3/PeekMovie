//
//  SessionModulePresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 24.10.2022.
//

import UIKit

protocol SessionModuleDelegate {
    func quitFromRoom()
}

final class SessionModulePresenter: NSObject {
    
    var appCoordinator: SessionModuleDelegate?
    
    internal var mainPage: PosterViewPage
    internal var secondaryPage: CollectionViewPage
    internal let networkService: NetworkService
    
    internal var currentMovie: MovieDTO?
    internal var currentPosterImage: UIImage?
    
    internal var webSocket: URLSessionWebSocketTask?
    
    internal var likedMovies: [MovieDTO]
    
    init(
        mainPage: PosterViewPage,
        secondaryPage: CollectionViewPage,
        networkService: NetworkService
    ) {
        self.mainPage = mainPage
        self.secondaryPage = secondaryPage
        self.networkService = networkService
        self.likedMovies = []
    }
    
    internal func setNewMovie(movie: MovieDTO) {
        self.currentMovie = movie
        self.mainPage.setNewMovieData(newMovie: movie)
        
        getData(from: URL(string: movie.url)!) { data, response, error in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async() { [weak self] in
                if let image = UIImage(data: data) {
                    self?.currentPosterImage = image
                    self?.mainPage.setPosterImage(img: image)
                } else {
                    self?.mainPage.setDummyPosterImage()
                }
            }
        }
    }
    
    internal func setCurrentMovie() {
        if let currentMovie = currentMovie {
            mainPage.setNewMovieData(newMovie: currentMovie)
            if let currentPosterImage = currentPosterImage {
                mainPage.setPosterImage(img: currentPosterImage)
            } else {
                mainPage.setDummyPosterImage()
            }
        } else {
            mainPage.setDummyMovieData()
        }
    }
    
    
    private func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
}
