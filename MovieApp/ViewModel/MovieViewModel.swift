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
    
    func getNowPlayingMovie() {
        network.fetchMovieDataFromAPI(url: APILinks.nowPlayingURL, expecting: MovieResponse.self) { [weak self] result in
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
        network.fetchMovieDataFromAPI(url: APILinks.upcomingURL, expecting: MovieResponse.self) { [weak self] result in
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
        network.fetchMovieDataFromAPI(url: APILinks.topRatedURL, expecting: MovieResponse.self) { [weak self] result in
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
        network.fetchMovieDataFromAPI(url: "\(APILinks.baseURL)\(movieID)?\(APILinks.apiKey)", expecting: Movie.self) { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let movie):
                DispatchQueue.main.async {
                    self?.movieDetails = nil
                    self?.movieDetails = movie
                }
            }
        }
    }
    
    func getMovieDataFromSearch(searchText: String) {
        network.fetchMovieDataFromAPI(url: "\(APILinks.searchURL)\(searchText)", expecting: MovieResponse.self) { [weak self] result in
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
        network.fetchMovieDataFromAPI(url: "\(APILinks.baseURL)\(movieID)/videos?\(APILinks.apiKey)", expecting: VideoResponse.self) { [weak self] result in
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
