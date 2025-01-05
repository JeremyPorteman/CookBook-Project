//
//  SearchBar.swift
//  CookBook
//
//  Created by Cléa JAN on 14/12/2024.
//

import SwiftUI

struct SearchBar: View {
    @Binding var search: String // Liaison pour le texte saisi dans le TextField
    
    var body: some View {
        HStack {
            // Icône de recherche
            Image("Icons/search")
            
            // Champ de texte pour la recherche
            TextField("Rechercher...", text: $search)
                .padding(7)
            
            Spacer()
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal)
    }
}

#Preview {
    @Previewable @State var searchText = "" // Variable d'état pour tester la barre de recherche
    
    SearchBar(search: $searchText)
}
