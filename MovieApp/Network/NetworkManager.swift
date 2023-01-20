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
            if let error = error {
                print(error)
            }
            
            guard let data = data else { return }
            
            do {
                let decodedData = try JSONDecoder().decode(MovieResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(decodedData.results)
                }
            } catch {
                print(error)
            }
        }
        .resume()
    }
    
//    func fetchGenericAPI<T: Codable>(url: String, expecting: T.Type ,completion: @escaping (Result<T, Error>) -> Void) {
//        guard let url = URL(string: url) else { return }
//
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            if let error = error {
//                completion(.failure(error))
//            }
//
//            guard let data = data else { return }
//
//            do {
//                let decodedData = try JSONDecoder().decode(expecting, from: data)
//                DispatchQueue.main.async {
//                    completion(.success(decodedData))
//                }
//            } catch {
//                completion(.failure(error))
//            }
//        }
//        .resume()
//    }
}
