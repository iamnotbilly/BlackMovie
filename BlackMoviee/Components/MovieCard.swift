//
//  MovieCard.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    var body: some View {
        VStack{
            CustomImageView(movie: movie, heightCard: 300, widthCard: 225)
            HStack {
                Text(movie.originalTitle)
                    .font(.title2)
                    .fontWeight(.semibold)
                .foregroundStyle(.white)
                .offset(x: 15)
                Spacer()
            }
        }
        .frame(width: 250)
        }
}

#Preview {
    MovieCard(movie: DeveloperPreview.instance.movie)
        .preferredColorScheme(.dark)
}

