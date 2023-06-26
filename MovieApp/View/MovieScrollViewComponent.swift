//
//  MovieScrollViewComponent.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 21/01/23.
//

import SwiftUI

struct MovieScrollViewComponent: View {
    var movie: [Movie] = []
    var title: String = ""
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(movie, id: \.id) { movie in
                        NavigationLink(value: movie.id) {
                            MoviePoster(imageURL: "https://image.tmdb.org/t/p/w1280/\(movie.poster ?? "")", movieTitle: movie.title)
                                .foregroundColor(colorScheme == .light ? .black : .white)
                        }
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

struct MovieScrollViewComponent_Previews: PreviewProvider {
    static var previews: some View {
        MovieScrollViewComponent()
            .environmentObject(MovieViewModel())
    }
}
