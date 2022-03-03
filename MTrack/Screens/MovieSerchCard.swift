//
//  MovieSerchCard.swift
//  MTrack
//
//  Created by Devolper.Scorpio on 04/03/2022.
//

import SwiftUI

struct MovieSearchCard: View {
    var movie : Movie
    @ObservedObject var imageLoader = ImageLoader()
    var body: some View{
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
            VStack(alignment: .leading){
                Text(movie.title).fontWeight(.bold).lineLimit(01).foregroundColor(Color.black)
                Text(movie.yearText).foregroundColor(Color.black.opacity(0.6))
                Text(movie.overview).fontWeight(.regular).lineLimit(02).foregroundColor(Color.black.opacity(0.4))
            }
        }.padding(.leading).padding(.trailing)
            .onAppear {
                self.imageLoader.loadImage(with: movie.backdropURL)
            }
    }
}
