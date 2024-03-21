//
//  ScoreCircle.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import SwiftUI

struct ScoreCircle: View {
    let movie: Movie
    @State private var showAnimation: Bool = false
    var body: some View {
        VStack(spacing: 15) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .frame(width: 115, height: 115)
                    .foregroundStyle(.gray.opacity(0.5))
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 10, y: 10)
                Circle()
                    .stroke(lineWidth: 0.34)
                    .frame(width: 90, height: 90)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black.opacity(0.3), .clear]), startPoint: .bottomTrailing, endPoint: .topLeading))
                    .overlay {
                        Circle()
                            .stroke(.black.opacity(0.1), lineWidth: 2)
                            .blur(radius: 5)
                            .mask {
                                Circle()
                                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .bottomTrailing, endPoint: .topLeading))
                            }
                    }
                Circle()
                    .trim(from: 0, to: (movie.voteAverage / 10))
                                        .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .frame(width: 115, height: 115)
                    .rotationEffect(.degrees(-90))
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.pink, .pink.opacity(0.5)]), startPoint: .topLeading, endPoint: .bottomTrailing))
                Text(movie.voteAverage.asNumberWith2Decimals() + " / 10")
                    .font(.subheadline)
                    .fontWeight(.semibold)
            }
            Text("score".capitalized)
                .font(.subheadline)
                .fontWeight(.semibold)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ScoreCircle(movie: DeveloperPreview.instance.movie)
}