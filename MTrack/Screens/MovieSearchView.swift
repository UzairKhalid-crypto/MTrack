//
//  MovieSearchView.swift
//  MTrack
//
//  Created by Devolper.Scorpio on 03/03/2022.
//  Copyright © 2022 Developer.Scorpio. All rights reserved.
//


import SwiftUI

struct MovieSearchView: View {
    
    @ObservedObject var movieSearchState = MovieSearchState()
    
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical , showsIndicators: false) {
                SearchBarView(placeholder: "Search movies", text: self.$movieSearchState.query)
                    .padding()
                
                LoadingView(isLoading: self.movieSearchState.isLoading, error: self.movieSearchState.error) {
                    self.movieSearchState.search(query: self.movieSearchState.query)
                }
                
                if self.movieSearchState.movies != nil {
                    ForEach(self.movieSearchState.movies!) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            MovieSearchCard(movie: movie)
                        }
                    }
                }
                
            }
            .onAppear {
                self.movieSearchState.startObserve()
               
            }
            .navigationBarTitle("Search")
        }
    }
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}

