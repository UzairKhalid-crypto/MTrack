//
//  MovieBackdropCard.swift
//  MTrack
//
//  Created by Devolper.Scorpio on 03/03/2022.
//  Copyright © 2022 Developer.Scorpio. All rights reserved.
//


import SwiftUI

struct MovieBackdropCard: View {
    
    let movie: Movie
    @ObservedObject var imageLoader = ImageLoader()
    
    var body: some View {
        HStack{
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                
                if self.imageLoader.image != nil {
                    Image(uiImage: self.imageLoader.image!)
                    .resizable()
                }
            }
            .frame(width: 150, height: 100, alignment: .leading)
            .aspectRatio(contentMode: .fill)
            .cornerRadius(8)
            .shadow(radius: 4)
            VStack(alignment: .leading) {
                Text(movie.title).fontWeight(.medium)
                Text(movie.overview).font(Font.system(size:14))
                    .fontWeight(.light).lineLimit(3)
            }
            Spacer()
        }
        .lineLimit(1)
        .onAppear {
            self.imageLoader.loadImage(with: self.movie.backdropURL)
        }
    }
}

struct MovieBackdropCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieBackdropCard(movie: Movie.stubbedMovie)
    }
}
