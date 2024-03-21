//
//  SearchView.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import SwiftUI

struct SearchView: View {
    @State var txtSearch: String = ""
    @EnvironmentObject private var vm: ViewModel
    
    var filteredMovies: [Movie] {
        let uniqueMovies = Set(vm.allMovies)
        return uniqueMovies.filter { $0.originalTitle.localizedCaseInsensitiveContains(txtSearch) }
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("What do u want?")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                    Spacer()
                }
                TextField("Type something...", text: $txtSearch)
                    .padding()
                    .background(
                    RoundedRectangle(cornerRadius: 25.0)
                        .fill(.gray.opacity(0.5))
                    )
                    .overlay(alignment: .trailing) {
                        ZStack {
                            Image.CancelSearchIcon
                                .foregroundStyle(.red)
                                .opacity(txtSearch.isEmpty ? 0.0 : 1.0)
                                .onTapGesture {
                                    txtSearch = ""
                                }
                            Image.SearchIcon
                                .foregroundStyle(.white)
                                .opacity(txtSearch.isEmpty ? 1.0 : 0.0)
                                .padding()
                        }
                    }
                ScrollView(.vertical) {
                    VStack {
                        ForEach(filteredMovies) { index in
                            MovieSearchCard(movie: index)
                        }
                    }
                }
                Spacer()
            } .padding()
                .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    SearchView()
        .environmentObject(ViewModel())
}
