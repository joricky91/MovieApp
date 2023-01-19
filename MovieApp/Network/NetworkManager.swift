//
//  NetworkManager.swift
//  MovieApp
//
//  Created by Jonathan Ricky Sandjaja on 19/01/23.
//

import Foundation

class NetworkManager {
    func fetchAPI(url: String, completion: @escaping ([Movie]) -> Void) {
        guard let url = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                fatalError("Cannot fetch data")
            }
            
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData.response)
                }
            } catch {
                fatalError("Cannot fetch data")
            }
        }
        .resume()
    }
}
