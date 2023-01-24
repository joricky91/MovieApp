//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 19/01/23.
//

import Foundation

class MovieViewModel: ObservableObject {
    @Published var nowPlaying: [Movie] = []
    @Published var upcoming: [Movie] = []
    @Published var topRated: [Movie] = []
    @Published var movieDetails: Movie?
    @Published var searchedMovies: [Movie] = []
    @Published var videos: [Videos] = []
    var network = NetworkManager()
    var nowPlayingURL = "https://api.themoviedb.org/3/movie/now_playing?api_key=dd961bfa9a816030820499683fe54a36"
    var upcomingURL = "https://api.themoviedb.org/3/movie/upcoming?api_key=dd961bfa9a816030820499683fe54a36"
    var topRatedURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=dd961bfa9a816030820499683fe54a36"
    
    func getNowPlayingMovie() {
        network.fetchMovieDataFromAPI(url: nowPlayingURL, expecting: MovieResponse.self) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movie):
                DispatchQueue.main.async {
                    self?.nowPlaying = movie.results
                }
            }
        }
    }
    
    func getUpcomingMovie() {
        network.fetchMovieDataFromAPI(url: upcomingURL, expecting: MovieResponse.self) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movie):
                DispatchQueue.main.async {
                    self?.upcoming = movie.results
                }
            }
        }
    }
    
    func getTopRatedMovie() {
        network.fetchMovieDataFromAPI(url: topRatedURL, expecting: MovieResponse.self) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movie):
                DispatchQueue.main.async {
                    self?.topRated = movie.results
                }
            }
        }
    }
    
    func getMovieDetails(movieID: Int) {
        network.fetchMovieDataFromAPI(url: "https://api.themoviedb.org/3/movie/\(movieID)?api_key=dd961bfa9a816030820499683fe54a36", expecting: Movie.self) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movie):
                DispatchQueue.main.async {
                    self?.movieDetails = movie
                }
            }
        }
    }
    
    func getMovieDataFromSearch(searchText: String) {
        network.fetchMovieDataFromAPI(url: "https://api.themoviedb.org/3/search/movie?api_key=dd961bfa9a816030820499683fe54a36&language=en-US&query=\(searchText)", expecting: MovieResponse.self) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movie):
                DispatchQueue.main.async {
                    self?.searchedMovies = movie.results
                }
            }
        }
    }
    
    func getMovieVideos(movieID: Int) {
        network.fetchMovieDataFromAPI(url: "https://api.themoviedb.org/3/movie/\(movieID)/videos?api_key=dd961bfa9a816030820499683fe54a36", expecting: VideoResponse.self) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case.success(let video):
                DispatchQueue.main.async {
                    self?.videos = video.results
                }
            }
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
