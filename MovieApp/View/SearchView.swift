//
//  SearchView.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 23/01/23.
//

import SwiftUI

struct SearchView: View {
    @State private var searchText = ""
    @EnvironmentObject var vm: MovieViewModel
    
    var body: some View {
        NavigationView {
            if searchText.isEmpty {
                Text("Find a Movie")
                    .fontWeight(.bold)
                    .font(.title2)
                    .foregroundColor(.gray)
                    .navigationTitle("Search")
            } else {
                List(vm.searchedMovies, id: \.id) { movie in
                    NavigationLink(destination: MovieDetails(movieID: movie.id)) {
                        Text(movie.title)
                    }
                }
                .listStyle(PlainListStyle())
                
            }
        }
        
        .searchable(text: $searchText, placement: .toolbar)
        .onSubmit(of: .search) {
            vm.getMovieDataFromSearch(searchText: searchText)
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(MovieViewModel())
    }
}
