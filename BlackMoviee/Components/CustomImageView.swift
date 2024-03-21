//
//  CustomImageView.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import SwiftUI

struct CustomImageView: View {
    let movie: Movie
    let heightCard: Double
    let widthCard: Double
    var body: some View {
        AsyncImage(url: movie.imgURLString) { img in
            img
                .resizable()
                .scaledToFill()
        } placeholder: {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(.gray.opacity(0.5))
                .overlay(alignment: .center) {
                    Image.LoadingImageicon
                        .foregroundStyle(.black)
                }
        }
        .frame(width: widthCard, height: heightCard)
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
    }
}

#Preview {
    CustomImageView(movie: DeveloperPreview.instance.movie, heightCard: 300, widthCard: 225)
}
