//
//  Movie.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import Foundation

struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Identifiable, Codable, Hashable {
    let id: Int
    let backdropPath: String?
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let voteAverage: Double
    let voteCount: Int
    let releaseDate: String
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    var imgURLString: URL? {
        let baseURL = URL(string: Constants.imageBaseURL)
        return baseURL?.appending(path: posterPath ?? "")
    }
    var imgBackdropPath: URL? {
        let baseURL = URL(string: Constants.imageBaseURL)
        return baseURL?.appending(path: backdropPath ?? "")
    }
}
