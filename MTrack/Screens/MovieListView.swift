//
//  MovieListView.swift
//  MTrack
//
//  Created by Devolper.Scorpio on 03/03/2022.
//  Copyright © 2022 Developer.Scorpio. All rights reserved.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var nowPlayingState = MovieListState()
    @ObservedObject private var topRatedState = MovieListState()
    
    var body: some View {
        NavigationView {
            
            ScrollView(.vertical , showsIndicators: false) {
                if self.nowPlayingState.error != nil{
                    LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                        self.nowPlayingState.loadMovies(with: .nowPlaying)
                        self.topRatedState.loadMovies(with: .topRated)
                    }
                }else{
                Group {
                    if nowPlayingState.movies != nil {
                        MoviePosterCarouselView(title: "Now Playing", movies: nowPlayingState.movies!)
                            .padding(.top)
                        
                    }
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
               
                Group {
                    if topRatedState.movies != nil {
                        MovieBackdropCarouselView(title: "Top Rated", movies: topRatedState.movies!)
                            .padding(.top)
                        
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            }
            }
       
            .navigationBarTitle("MTrack")
        }
        .onAppear {
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.topRatedState.loadMovies(with: .topRated)
        }
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}

