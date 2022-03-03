//
//  MovieBackdropCarouselView.swift
//  MTrack
//
//  Created by Devolper.Scorpio on 03/03/2022.
//  Copyright © 2022 Developer.Scorpio. All rights reserved.
//


import SwiftUI

struct MovieBackdropCarouselView: View {
    
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack{
                    ForEach(self.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            MovieBackdropCard(movie: movie).padding(.leading).padding(.trailing)
                        }
                        .buttonStyle(PlainButtonStyle())
                        .padding(.top, movie.id == self.movies.first!.id ? 16 : 0)
                    }
                }
            }
        }
    }
}

struct MovieBackdropCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCarouselView(title: "Latest", movies: Movie.stubbedMovies)
    }
}
