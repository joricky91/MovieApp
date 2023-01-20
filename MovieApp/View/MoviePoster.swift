//
//  MoviePoster.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 19/01/23.
//

import SwiftUI

struct MoviePoster: View {
    var imageURL: String = ""
    var movieTitle: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: imageURL), content: { image in
                image
                    .resizable()
            }, placeholder: {
                Text("Loading image")
            })
            .cornerRadius(5)
            .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 2)
            
            Text(movieTitle)
                .frame(width: UIScreen.main.bounds.width / 3, height: UIScreen.main.bounds.width / 8, alignment: .topLeading)
        }
    }
}

struct MoviePoster_Previews: PreviewProvider {
    static var previews: some View {
        MoviePoster()
    }
}
