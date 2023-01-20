//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 19/01/23.
//

import Foundation

class MovieViewModel: ObservableObject {
    @Published var movie: [Movie] = []
    @Published var upcoming: [Movie] = []
    @Published var topRated: [Movie] = []
    @Published var movieDetails: Movie?
    var network = NetworkManager()
    var nowPlayingURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=dd961bfa9a816030820499683fe54a36"
    var upcomingURL = "https://api.themoviedb.org/3/movie/upcoming?api_key=dd961bfa9a816030820499683fe54a36"
    var topRatedURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=dd961bfa9a816030820499683fe54a36"
    
    func getMovieData() {
        network.fetchAPI(url: nowPlayingURL) { movie in
            self.movie = movie
        }
    }
    
    func getUpcomingMovie() {
        network.fetchAPI(url: upcomingURL) { movie in
            self.upcoming = movie
        }
    }
    
    func getTopRatedMovie() {
        network.fetchAPI(url: topRatedURL) { movie in
            self.topRated = movie
        }
    }
    
    func getMovieDetails(movieID: Int) {
        network.fetchMovieDetails(url: "https://api.themoviedb.org/3/movie/\(movieID)?api_key=dd961bfa9a816030820499683fe54a36") { movie in
            self.movieDetails = movie
        }
    }
    
    func arrangeMovieGenresInHorizontalText() -> String {
        var joinedWords = ""
        
        self.movieDetails?.genres?.forEach({ genre in
            joinedWords.append("\(genre.name), ")
        })
        
        return joinedWords
    }
}
