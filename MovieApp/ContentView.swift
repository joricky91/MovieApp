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
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    MovieScrollViewComponent(movie: vm.movie, title: "Now Playing")
                    
                    MovieScrollViewComponent(movie: vm.upcoming, title: "Upcoming")
  
                    MovieScrollViewComponent(movie: vm.topRated, title: "Top Rated")
                    
                }
                .onAppear {
                    vm.getMovieData()
                    vm.getUpcomingMovie()
                    vm.getTopRatedMovie()
                }
                .padding(.leading)
                .padding(.top)
                .navigationTitle("Movie")
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
