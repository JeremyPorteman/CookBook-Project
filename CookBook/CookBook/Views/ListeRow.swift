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
    var colorArticle: Color = Color(red: 240/255.0, green: 106/255.0, blue: 111/255.0)
    
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(nomListe).padding(1).font(.title)
                Text("\(nbArticles) articles").padding(3)
                    .background(colorArticle)
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
            Spacer()
            Image(systemName: "arrow.right").foregroundStyle(.gray)
        }.padding()
    }
}

#Preview {
    ListeRow(nomListe: "Liste Maison", nbArticles: 5)
}
