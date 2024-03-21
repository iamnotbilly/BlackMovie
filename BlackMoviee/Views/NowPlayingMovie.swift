//
//  NowPlayingMovie.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import SwiftUI

struct NowPlayingMovie: View {
    @EnvironmentObject var vm: ViewModel
    var body: some View {
        NavigationStack {
            VStack (spacing: 5){
                HStack {
                    Text("Now Playing")
                        .offset(x: 15)
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                }
                
               ScrollView(.horizontal, showsIndicators: false){
                   HStack {
                       ForEach(vm.nowPlayingMovies) {
                           index in
                           NavigationLink {
                               DetailView(movie: index)
                           } label: {
                               MovieCard(movie: index)
                           }
                       }
                   } .task {
                       vm.getNowPlayingMovies()
                   }
               }
            }
        }
    }
}

#Preview {
    NowPlayingMovie()
        .environmentObject(ViewModel())
}

