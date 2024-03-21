//
//  Avatar.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import SwiftUI

struct Avatar: View {
    let movie: Movie
    var body: some View {
        CustomImageView(movie: movie, heightCard: 200, widthCard: 150)   
    }
}

#Preview {
    Avatar(movie: DeveloperPreview.instance.movie)
}
