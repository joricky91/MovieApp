//
//  ContentView.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 19/01/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: MovieViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    MovieScrollViewComponent(movie: vm.nowPlaying, title: "Now Playing")
                    
                    MovieScrollViewComponent(movie: vm.upcoming, title: "Upcoming")
  
                    MovieScrollViewComponent(movie: vm.topRated, title: "Top Rated")
                    
                }
                .onAppear {
                    vm.getNowPlayingMovie()
                    vm.getUpcomingMovie()
                    vm.getTopRatedMovie()
                }
                .padding(.leading)
                .padding(.top)
            }
            .navigationTitle("Movie")
            .navigationDestination(for: Int.self) { movie in
                MovieDetails(movieID: movie)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MovieViewModel())
    }
}
