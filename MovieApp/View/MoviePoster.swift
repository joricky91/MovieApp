//
//  MoviePoster.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 19/01/23.
//

import SwiftUI

struct MoviePoster: View {
    var imageURL: String = ""
    
    var body: some View {
        AsyncImage(url: URL(string: imageURL), content: { image in
            image
                .resizable()
        }, placeholder: {
            Text("Loading image")
        })
        .cornerRadius(5)
        .frame(width: UIScreen.main.bounds.width / 2, height: UIScreen.main.bounds.width / 2)
    }
}

struct MoviePoster_Previews: PreviewProvider {
    static var previews: some View {
        MoviePoster()
    }
}
