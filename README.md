# Movie App using TMDB API
This is a project I created to train and learn how to fetch data from API. This app features:
- List of Now Playing, Upcoming, and Top Rated movies.
- Movie details for each movie.
- Search movie based on movie's name.

This project is created for iOS platform, the tech stack I used in this projects are:
- Swift
- SwiftUI
- MVVM Design Pattern
- TMDB API: https://www.themoviedb.org/documentation/api

In this project, 1 new thing I learn is to create a generic function to fetch data from an API, so I could fetch any data I want regarding its structure. The code for that function:
```swift
func fetchMovieDataFromAPI<T: Codable>(url: String, expecting: T.Type ,completion: @escaping (Result<T, Error>) -> Void) {
    guard let url = URL(string: url) else { return }

    URLSession.shared.dataTask(with: url) { data, response, error in
        if let error = error {
            completion(.failure(error))
        }

        guard let data = data else { return }

        do {
            let decodedData = try JSONDecoder().decode(expecting, from: data)
            DispatchQueue.main.async {
                completion(.success(decodedData))
            }
        } catch {
            completion(.failure(error))
        }
    }
    .resume()
}
```
I used generics that conforms to the Codable protocol, so I could fetch any data from any API I want.

