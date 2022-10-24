//
//  PosterImageViewModel.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 1.10.2022.
//

import SwiftUI

class PosterImageViewModel: ObservableObject {
    let service: ImageService
    
    @Published var image: UIImage?
    @Published var isLoading: Bool = true
    
    init(path: String) {
        service = ImageService(path: path)
        getImage()
}
    
    func getImage() {
        service.downloadImage { [weak self] returnedImage in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
                self.image = returnedImage
            }
        }
    }
}
