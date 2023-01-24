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
        ScrollView {
            VStack(alignment: .leading) {
                Text(vm.movieDetails?.title ?? "")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w1000_and_h563_face/\(vm.movieDetails?.backdrop ?? "")"), content: { image in
                    image
                        .resizable()
                }, placeholder: {
                    Text("Loading image")
                })
                .cornerRadius(10)
                .frame(height: UIScreen.main.bounds.width / 1.8)
                .padding(.horizontal)
                
                
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 5) {
                        Text("**Release Date:** \(vm.movieDetails?.releaseDate ?? "")")
                        
                        Text("**Runtime:** \(vm.movieDetails?.runtime ?? 0) minutes")
                        
                        Text("**Genres:** \(vm.arrangeMovieGenresInHorizontalText())")
                            .padding(.bottom, 5)
                    }
                    
                    Text(vm.movieDetails?.overview ?? "")
                        .padding(.bottom)
                    
                    Text("Videos")
                        .padding(.bottom, 3)
                        .fontWeight(.bold)
                    
                    ForEach(vm.videos, id: \.id) { video in
                        VStack {
                            HStack {
                                Link(destination: URL(string: "https://www.youtube.com/watch?v=\(video.key)")!) {
                                    Text(video.name)
                                        .multilineTextAlignment(.leading)
                                }
                                
                                Spacer()
                                
                                Image(systemName: "play.rectangle.fill")
                            }
                            
                            Divider()
                        }
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                vm.getMovieDetails(movieID: movieID)
                vm.getMovieVideos(movieID: movieID)
        }
        }
    }
}

struct MovieDetails_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetails()
            .environmentObject(MovieViewModel())
    }
}
