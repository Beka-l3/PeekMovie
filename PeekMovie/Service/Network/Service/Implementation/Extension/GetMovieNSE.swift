//
//  GetMovieNSE.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 16.08.2023.
//

import Foundation

extension NetworkServiceImplementation {
    
    @discardableResult
    func getMovie(
        credentials: (token: TokenDTO, roomId: String),
        completion: @escaping (Result<ResponseDTO<MovieDTO>, HTTPError>) -> Void
    ) -> Cancellable? {
        
        
        
        return nil
    }
    
}
