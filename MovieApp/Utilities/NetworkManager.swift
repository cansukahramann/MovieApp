//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 30.09.2022.
//

import Foundation

class NetworkManager {
    // Singleton
    static let shared = NetworkManager()
    private init() {}
    // Singleton
    
    func download(url: URL, completion: @escaping (Result<Data, CKError>) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completion(.failure(.urlError))
                return
            }
            
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200 else {
                
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            completion(.success(data))
        }
        .resume()
    }
    
    
}
