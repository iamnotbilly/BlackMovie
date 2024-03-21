//
//  MovieSearchCard.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import SwiftUI

struct MovieSearchCard: View {
    let movie: Movie
    var body: some View {
        NavigationStack {
            NavigationLink {
                DetailView(movie: movie)
            } label: {
                HStack {
                    CustomImageView(movie: movie, heightCard: 120, widthCard: 90)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(alignment: .leading) {
                        Text(movie.originalTitle)
                            .font(.title2)
                            .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        Text(movie.releaseDate)
                            .font(.subheadline)
                            .foregroundStyle(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Image(systemName: "control")
                        .font(.title2)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .rotationEffect(Angle(degrees: 90))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
            }
            .padding(.horizontal)
        } .preferredColorScheme(.dark)
    }
}

#Preview {
    MovieSearchCard(movie: DeveloperPreview.instance.movie)
}
