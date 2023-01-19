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
            List(vm.movie, id: \.id) { movie in
                MoviePoster(imageURL: "https://image.tmdb.org/t/p/w1280/\(movie.poster)")
            }
            .listStyle(PlainListStyle())
            .onAppear {
                vm.getMovieData()
            }
            .navigationTitle("Movie")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MovieViewModel())
    }
}
