//
//  ImageService.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 1.10.2022.
//

import SwiftUI

class ImageService {
    
    let path: String
    
    init(path: String) {
        self.path = path
    }
    
    func downloadImage(completion: @escaping (UIImage?) -> ()) {
        guard let url = URL(string: APIURL.poster(path: path)) else { return }
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let _ = self else { return }
            
            switch result {
            case .success(let data):
                completion(UIImage(data: data))
            case .failure(let error):
                print(error)
                completion(nil)
            }
        }
    }
}
