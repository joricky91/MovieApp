//
//  TabBarView.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 23/01/23.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Movie", systemImage: "film")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
