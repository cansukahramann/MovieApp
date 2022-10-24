//
//  DetailModel.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 1.10.2022.
//

import Foundation

struct DetailModel: Codable {
    let adult: Bool?
    let backdropPath: String?
    let genres: [Genre]?
    let overview, releaseDate: String?
    let runtime: Int?
    let title: String?
    let voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genres, overview
        case releaseDate = "release_date"
        case runtime, title
        case voteAverage = "vote_average"
    }
    
    var _backdropPath: String {
        backdropPath ?? ""
    }
    
    var _title: String {
        title ?? "N/A"
    }
    
    var _overview: String {
        overview ?? "N/A"
    }
    
    var _releaseDate: String {
        releaseDate ?? "N/A"
    }
    
    var _runtime: String {
        if let runtime = runtime {
            return String(runtime)
        }
        
        return "N/A"
    }
    
    var _voteAverage: String {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1
        formatter.minimumFractionDigits = 1
        
        return formatter.string(from: NSNumber(value: voteAverage ?? 0)) ?? "0.0"
    }
    
    var _genres: [String] {
        var array: [String] = []
        if let genres = genres {
            genres.forEach { genre in
                if let name = genre.name {
                    array.append(name)
                }
            }
        }
        
        if array.isEmpty {
            return ["N/A"]
        }
        
        return array
    }
    
    static let mockData = DetailModel(adult: false, backdropPath: "/w2PMyoyLU22YvrGK3smVM9fW1jj.jpg", genres: [Genre(id: 28, name: "Action"), Genre(id: 12, name: "Adventure"), Genre(id: 878, name: "Science Fiction")], overview: "The story follows Carol Danvers as she becomes one of the universe’s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races. Set in the 1990s, Captain Marvel is an all-new adventure from a previously unseen period in the history of the Marvel Cinematic Universe.", releaseDate: "2019-03-06", runtime: 124, title: "Captain Marvel", voteAverage: 6.893)
}

struct Genre: Codable {
    let id: Int?
    let name: String?
    
}
