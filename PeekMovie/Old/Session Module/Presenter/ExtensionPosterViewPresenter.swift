//
//  ExtensionPosterViewPresenter.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.11.2022.
//

import Foundation


extension SessionModulePresenter: PosterViewDelegate {
    func getMovie() {
        if
            currentMovie == nil,
            let token = UserDefaults.standard.string(forKey: GConstants.tokenKey),
            let roomId = UserDefaults.standard.string(forKey: GConstants.roomIdKey)
        { setMovie(token: TokenDTO(token: token), roomId: roomId) }
    }
    
    func likeMovie() {
        if
            let token = UserDefaults.standard.string(forKey: GConstants.tokenKey),
            let roomId = UserDefaults.standard.string(forKey: GConstants.roomIdKey)
        { setMovie(token: TokenDTO(token: token), roomId: roomId, like: true) }
    }
    
    func dislikeMovie() {
        if
            let token = UserDefaults.standard.string(forKey: GConstants.tokenKey),
            let roomId = UserDefaults.standard.string(forKey: GConstants.roomIdKey)
        { setMovie(token: TokenDTO(token: token), roomId: roomId) }
    }
    
    private func setMovie(token: TokenDTO, roomId: String, like: Bool = false) {
        networkService.getMovie(credentials: (token, roomId) ) { [weak self] result in
            switch result {
            case .success(let response):
                if let movie = self?.currentMovie {
                    self?.likedMovies.append(movie)
                    self?.secondaryPage.updateData()
                }
                if let data = response.data {
                    self?.setNewMovie(movie: data)
                } else if let _ = response.error {
                    self?.setCurrentMovie()
                    self?.mainPage.popInfoLabel(type: .internalError)
                    self?.mainPage.setDummyMovieData()
                } else {
                    self?.setCurrentMovie()
                    self?.mainPage.popInfoLabel(type: .serverError)
                }
            case .failure(_):
                self?.setCurrentMovie()
                self?.mainPage.popInfoLabel(type: .internalError)
            }
        }
    }
    
}
