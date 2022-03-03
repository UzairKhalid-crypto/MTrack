//
//  MovieListObservableObject.swift
//  MTrack
//
//  Created by Devolper.Scorpio on 03/03/2022.
//  Copyright © 2022 Developer.Scorpio. All rights reserved.
//


import SwiftUI

class MovieListState: ObservableObject {
    
    @Published var movies: [Movie]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let movieService: MovieService
    
    init(movieService: MovieService = MovieStore.shared) {
        self.movieService = movieService
    }
    
    func loadMovies(with endpoint: MovieListEndpoint) {
        self.movies = nil
        self.isLoading = true
        self.movieService.fetchMovies(from: endpoint) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.movies = response.results
                
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
}

