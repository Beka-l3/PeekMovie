//
//  NetworkClient.swift
//  PeekMovie
//
//  Created by Bekzhan Talgat on 17.10.2022.
//
import Foundation


struct NetworkClientImplementation: NetworkClientOLD {
    private let urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }

    @discardableResult
    func processRequest<T: Decodable>(
        request: HTTPRequest,
        completion: @escaping (Result<T, HTTPError>) -> Void
    ) -> Cancellable? {
        
        do {
            
            let configuredURLRequest = try configureRequest(request: request)
            
            let task = urlSession.dataTask(with: configuredURLRequest) { data, response, _ in
                
                guard let response = response as? HTTPURLResponse, let unwrappedData = data else {
                    NetworkClientImplementation.executeCompletionOnMainThread {
                        completion(.failure(HTTPError.decodingFailed))
                    }
                    return
                }
                
                let handledResult = HTTPNetworkResponse.handleNetworkResponse(for: response)
                
                switch handledResult {
                
                case .success:
                    let jsonDecoder = JSONDecoder()
                    
                    jsonDecoder.keyDecodingStrategy = request.keyDecodingStrategy
                    jsonDecoder.dateDecodingStrategy = request.dateDecodingStrategy

//                    if T.self == Empty.self && unwrappedData.isEmpty {
//                        completion(.success(Empty() as! T))
//                        return
//                    }
                    
                    guard let result = try? jsonDecoder.decode(T.self, from: unwrappedData) else {
                        NetworkClientImplementation.executeCompletionOnMainThread {
                            completion(.failure(HTTPError.decodingFailed))
                        }
                        return
                    }

                    NetworkClientImplementation.executeCompletionOnMainThread {
                        completion(.success(result))
                    }
                    
                case .failure:
                    NetworkClientImplementation.executeCompletionOnMainThread {
                        completion(.failure(HTTPError.failed))
                    }
                    
                }
            }

            task.resume()
            return task
            
        } catch {
            
            NetworkClientImplementation.executeCompletionOnMainThread {
                completion(.failure(HTTPError.failed))
            }

            return nil
        }
        
    }

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

    private static func executeCompletionOnMainThread(_ closure: @escaping () -> Void) {
        DispatchQueue.main.async {
            closure()
        }
    }
}

// MARK: - Cancellable

extension URLSessionDataTask: Cancellable {}
