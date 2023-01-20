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
    var network = NetworkManager()
    var nowPlayingURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=dd961bfa9a816030820499683fe54a36"
    var upcomingURL = "https://api.themoviedb.org/3/movie/upcoming?api_key=dd961bfa9a816030820499683fe54a36"
    
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
}
