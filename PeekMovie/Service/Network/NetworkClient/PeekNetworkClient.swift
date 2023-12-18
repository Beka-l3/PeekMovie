//
//  NetworkClient.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 12.12.2023.
//

import Foundation


struct PeekNetworkClient: NetworkClient {
    
    private let urlSession: URLSession
    
    
//    MARK: lifecycle
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
 
    
//    MARK: exposed func
    @discardableResult
    func processRequest<T: Decodable>(request: HTTPRequest) async throws -> T {
        
        return try await withCheckedThrowingContinuation { continuation in
            
            do {
                
                let configuredURLRequest = try configureRequest(request: request)
                
                let task = urlSession.dataTask(with: configuredURLRequest) { data, response, _ in
                    
                    guard let response = response as? HTTPURLResponse, let unwrappedData = data else {
                        continuation.resume(throwing: HTTPError.decodingFailed)
                        return
                    }
                    
                    let handledResult = HTTPNetworkResponse.handleNetworkResponse(for: response)
                    
                    switch handledResult {
                        
                    case .success:
                        let jsonDecoder = JSONDecoder()
                        
                        jsonDecoder.keyDecodingStrategy = request.keyDecodingStrategy
                        jsonDecoder.dateDecodingStrategy = request.dateDecodingStrategy
                        
                        if T.self == EmptyResponse.self && unwrappedData.isEmpty {
                            continuation.resume(returning: EmptyResponse() as! T)
                            return
                        }
                        
                        guard let result = try? jsonDecoder.decode(T.self, from: unwrappedData) else {
                            continuation.resume(throwing: HTTPError.decodingFailed)
                            return
                        }
                        
                        continuation.resume(returning: result)
                        
                    case .failure:
                        continuation.resume(throwing: HTTPError.failed)
                        
                    }
                    
                }
                
                task.resume()
                
            } catch {
                
                continuation.resume(throwing: HTTPError.failed)
                
            }
            
        }
    }
    
    
//    MARK: private func
    private func configureRequest(request: HTTPRequest) throws -> URLRequest {
        guard var components = URLComponents(string: request.route) else { throw HTTPError.missingURL }

        let queriesArray = request.queryItems.map { query in
            URLQueryItem(name: query.key, value: query.value)
        }

        components.queryItems = queriesArray

        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")

        guard let componentsURL = components.url else { throw HTTPError.missingURLComponents }
        var generatedRequest = URLRequest(url: componentsURL)

        generatedRequest.httpMethod = request.httpMethod.rawValue
        generatedRequest.httpBody = request.body

        request.headers.forEach {
            generatedRequest.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        return generatedRequest
    }
    
}
