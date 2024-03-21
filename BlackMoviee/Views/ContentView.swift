//
//  ContentView.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var vm: ViewModel
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                Banner()
                CrossBar()
                NowPlayingMovie()
                CrossBar()
                PopularMovie()
                CrossBar()
                UpcomingMovie()
                CrossBar()
                TopRatedMovie()
            }
            .navigationTitle("Black Movie")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink {
                            SearchView()
                        } label: {
                            Image.SearchIcon
                                .foregroundStyle(.white)
                        }
                }
            })
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
        .environmentObject(ViewModel())
}

