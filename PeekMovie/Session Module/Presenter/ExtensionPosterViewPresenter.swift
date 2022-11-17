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
            let token = UserDefaults.standard.string(forKey: GConstants.tokenKey),
            let roomId = UserDefaults.standard.string(forKey: GConstants.roomIdKey)
        {
            networkService.getMovie(credentials: (TokenDTO(token: token), roomId) ) { [weak self] result in
                switch result {
                case .success(let response):
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
    
    func likeMovie() {
        getMovie()
    }
    
    func dislikeMovie() {
        getMovie()
    }
    
    
}
