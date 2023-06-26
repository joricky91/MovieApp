//
//  APILinks.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 26/06/23.
//

import Foundation

class APILinks {
    
    static let apiKey = "api_key=dd961bfa9a816030820499683fe54a36"
    static let baseURL = "https://api.themoviedb.org/3/movie/"
    
    static let nowPlayingURL = "\(baseURL)now_playing?\(apiKey)"
    static let upcomingURL = "\(baseURL)upcoming?\(apiKey)"
    static let topRatedURL = "\(baseURL)top_rated?\(apiKey)"
    static let searchURL = "https://api.themoviedb.org/3/search/movie?\(apiKey)&language=en-US&query="
    
}
