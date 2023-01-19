//
//  ContentView.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 19/01/23.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var vm: MovieViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(vm.movie, id: \.id) { movie in
                        NavigationLink(destination: {
                            MovieDetails()
                        }, label: {
                            MoviePoster(imageURL: "https://image.tmdb.org/t/p/w1280/\(movie.poster)")
                                .padding()
                        })
                    }
                }
                .onAppear {
                    vm.getMovieData()
                }
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
