//
//  SearchBar.swift
//  CookBook
//
//  Created by Cléa JAN on 14/12/2024.
//

import SwiftUI

struct SearchBar: View {
    var body: some View {
        HStack {
            Image("Icons/search")
            Text("Rechercher...")
                .foregroundColor(Color.gray)
            Spacer()
        }.padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.gray, lineWidth: 2)
        )
    }
}

#Preview {
    SearchBar()
}
