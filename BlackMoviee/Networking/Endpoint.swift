//
//  Endpoint.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import Foundation

enum Endpoint {
    case popular, topRated, nowPlaying, upcoming
    var path: String {
        switch self {
        case .popular: return "/3/movie/popular"
        case .topRated: return "/3/movie/top_rated"
        case .nowPlaying: return "/3/movie/now_playing"
        case .upcoming: return "/3/movie/upcoming"
        }
    }
    var fullPath: String {
        Constants.apiBaseURL + path + "?api_key=" + Constants.apiKey
    }
}
