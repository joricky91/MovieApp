//
//  MovieDetails.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 19/01/23.
//

import SwiftUI

struct MovieDetails: View {
    @EnvironmentObject var vm: MovieViewModel
    var movieID: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w1000_and_h563_face/\(vm.movieDetails?.backdrop ?? "")"), content: { image in
                image
                    .resizable()
            }, placeholder: {
                Text("Loading image")
            })
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width / 1.8)
            
            VStack(alignment: .leading) {
                Text(vm.movieDetails?.title ?? "")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 5)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Release Date: \(vm.movieDetails?.releaseDate ?? "")")
                    
                    Text("Runtime: \(vm.movieDetails?.runtime ?? 0) minutes")
                    
                    Text("Genres: \(vm.arrangeMovieGenresInHorizontalText())")
                        .padding(.bottom, 5)
                }
                
                Text(vm.movieDetails?.overview ?? "")
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            vm.getMovieDetails(movieID: movieID)
        }
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails()
            .environmentObject(MovieViewModel())
    }
}
