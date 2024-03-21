//
//  Banner.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import SwiftUI

struct Banner: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        NavigationStack {
            TabView {
                ForEach(vm.popularMovies) {
                    index in
                    NavigationLink {
                        DetailView(movie: index)
                    } label: {
                        AsyncImage(url: index.imgURLString) { img in
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
                    }
                }
            }   .tabViewStyle(PageTabViewStyle())
                .frame(height: 500)
                .task {
                    vm.getPopularMovies()
            }
        }
    }
}

#Preview {
    Banner()
        .preferredColorScheme(.dark)
        .environmentObject(ViewModel())
}

