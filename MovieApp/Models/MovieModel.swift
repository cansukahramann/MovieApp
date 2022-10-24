//
//  MovieModel.swift
//  MovieApp
//
//  Created by Cansu Kahraman on 30.09.2022.
//

import SwiftUI

struct MovieModel: Decodable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieResult: Decodable, Identifiable {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    var _title: String {
        title ?? "N/A"
    }
    
    var _releaseDate: String {
        releaseDate ?? "N/A"
    }
    
    var _id: String {
        String(id ?? 0) 
    }
}

enum OriginalLanguage: String, Decodable {
    case de = "de"
    case en = "en"
    case fr = "fr"
    case it = "it"
}

