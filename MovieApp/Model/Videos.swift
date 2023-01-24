//
//  Videos.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 24/01/23.
//

import Foundation

struct VideoResponse: Codable {
    var results: [Videos]
}

struct Videos: Codable {
    let id: String
    let name: String
    let key: String
}
