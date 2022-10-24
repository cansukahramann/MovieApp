//
//  APIURL.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 30.09.2022.
//

import Foundation

enum APIURL {
    static private let api_key = "b9df2a6976d6dd6ad797595884995d6e"
    static private let base_url = "https://api.themoviedb.org/3"
    
    static func search(query: String) -> String {
        return "\(base_url)/search/movie?api_key=\(api_key)&language=en-US&query=\(query)&page=1&include_adult=false"
    }
    
    static func poster(path: String) -> String {
        return "https://image.tmdb.org/t/p/w500\(path)"
    }
    
    static func detail(id: String) -> String {
        return "\(base_url)/movie/\(id)?api_key=\(api_key)&language=en-US"
    }
 
    
}
