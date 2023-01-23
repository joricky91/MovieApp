//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 19/01/23.
//

import SwiftUI

@main
struct MovieAppApp: App {
    var body: some Scene {
        WindowGroup {
            TabBarView()
                .environmentObject(MovieViewModel())
        }
    }
}
