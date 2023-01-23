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
    var results: [Movie] {
        if searchText.isEmpty {
            return vm.searchedMovies
        } else {
            return vm.searchedMovies.filter { $0.title.contains(searchText) }
        }
    }
    
    var body: some View {
        NavigationView {
            List(results, id: \.id) { movie in
                NavigationLink(destination: MovieDetails(movieID: movie.id)) {
                    Text(movie.title)
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $searchText, placement: .toolbar)
            .onSubmit(of: .search) {
                vm.getMovieDataFromSearch(searchText: searchText)
            }
            .navigationTitle("Search")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(MovieViewModel())
    }
}
