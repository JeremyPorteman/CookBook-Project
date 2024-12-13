//
//  ListeRow.swift
//  CookBook
//
//  Created by Cléa JAN on 10/12/2024.
//

import SwiftUI

struct ListeRow: View {
    var nomListe: String
    var nbArticles: Int
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(nomListe).padding(1).font(.title)
                Text(" \(nbArticles) article\(nbArticles > 1 ? "s " : " ")").padding(3)                    .background(Color("ROUGE"))
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
            Spacer()
            Image("Icons/chevron-right");
        }
        .padding()
    }
}

#Preview {
    ListeRow(nomListe: "Liste Maison", nbArticles: 2)
}
