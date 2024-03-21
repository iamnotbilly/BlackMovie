//
//  CrossBar.swift
//  BlackMoviee
//
//  Created by Black Billy on 21/3/24.
//

import SwiftUI

struct CrossBar: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(height: 1)
                .foregroundStyle(.white.opacity(0.3))
        }
        .padding()
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CrossBar()
}
