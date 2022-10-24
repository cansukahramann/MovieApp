//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 30.09.2022.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
    // Service
    let movieService = MovieService()
    let detailService = DetailService()
    
    
    // Variables
    @Published var searchText: String = ""
    @Published var detail: DetailModel?
    @Published var showDetail: Bool = false
    
    @Published var movies: [MovieResult] = []

    
    init() {
        showDetail = false
    }
    
    func getMovies(query: String) {
        movieService.downloadMovies(query: query) { [weak self] movieModel in
            guard let self = self else { return }
            guard let movieModel = movieModel else { return }
            
            guard let returnedMovies = movieModel.results else { return }
            
            DispatchQueue.main.async {
                withAnimation {
                    self.movies = returnedMovies
                }
            }
        }
    }
     
    
    func getDetail(id: String) {
        detailService.downloadDetail(id: id) { [weak self] returnedDetail in
            guard let self = self else { return }
            
            guard let returnedDetail = returnedDetail else { return }
            
            DispatchQueue.main.async {
                self.showDetail = true
                self.detail = returnedDetail
            }
        }
    }
}
