//
//  DetailView.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import SwiftUI

struct DetailView: View {
    let movie: Movie
    @EnvironmentObject private var vm: ViewModel
    @Environment(\.dismiss) private var dm
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    dm()
                }, label: {
                    Image.BackIcon
                })
                Spacer()
                Text(movie.originalTitle)
                Spacer()
            }
                .foregroundStyle(.white)
                .padding(.horizontal)
                ScrollView(.vertical, showsIndicators: true) {
                    ZStack {
                        VStack {
                            AsyncImage(url: movie.imgBackdropPath) { img in
                                img
                                    .resizable()
                                    .scaledToFit()
                            } placeholder: {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .fill(.gray.opacity(0.5))
                                    .overlay(alignment: .center) {
                                        Image.LoadingImageicon
                                            .foregroundStyle(.black)
                                    }
                            }
                            .frame(height: 300)
                            .clipped()
                            Spacer()
                        }
                        VStack {
                            Spacer()
                            HStack {
                                HStack {
                                    Avatar(movie: movie)
                                    Text(movie.releaseDate)
                                        .offset(x: 60, y: 30)
                                        .fontWeight(.semibold)
                                }
                                .offset(x: -50)
                            }
                        }
                    }
                    .frame(height: 400)
                    CrossBar()
                    VStack {
                        HStack {
                            Text("overview".capitalized)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                            Spacer()
                        }
                        Text(movie.overview)
                    } .padding(.horizontal)
                    CrossBar()
                    HStack {
                        ScoreCircle(movie: movie)
                            .padding(.horizontal)
                        PopularityCircle(movie: movie)
                            .padding(.horizontal)
                    }
                    .padding()
                }
            }
            .navigationBarBackButtonHidden()
            .preferredColorScheme(.dark)
        }
    }
    
#Preview {
    DetailView(movie: DeveloperPreview.instance.movie)
        .environmentObject(ViewModel())
}
