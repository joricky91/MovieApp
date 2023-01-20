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
            VStack(alignment: .leading) {
                Text("Now Playing")
                    .font(.title)
                    .fontWeight(.bold)
                
                ScrollView(.horizontal) {
                    HStack(spacing: 16) {
                        ForEach(vm.movie, id: \.id) { movie in
                            MoviePoster(imageURL: "https://image.tmdb.org/t/p/w1280/\(movie.poster)")
                        }
                    }
                }
                .onAppear {
                    vm.getMovieData()
                }
                .navigationTitle("Movie")
            }
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(MovieViewModel())
    }
}
