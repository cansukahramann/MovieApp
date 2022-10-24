//
//  MovieService.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 30.09.2022.
//

import Foundation

class MovieService {
    func downloadMovies(query: String, completion: @escaping (MovieModel?) -> ()) {
        guard let url = URL(string: APIURL.search(query: query)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else { return }
            switch result{
            case .success(let data):
                completion(self.handleData(data))
            case .failure(let error):
                self.handleError(error)
                completion(nil)
            }
        }
    }
    
    private func handleData(_ data: Data) -> MovieModel? {
        do {
            let movies = try JSONDecoder().decode(MovieModel.self, from: data)
            return movies
        } catch {
            handleError(.decodeError)
            return nil
        }
    }
    
    private func handleError(_ error: CKError) {
        print(error.rawValue)
    }

}
