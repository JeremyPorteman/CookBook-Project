//
//  ListeRow.swift
//  CookBook
//
//  Created by Cléa JAN on 10/12/2024.
//

import SwiftUI

struct ListeRow: View {
    var liste: Liste
    
    var nbArticles: Int {
           liste.articles.count
    }
    
    var body: some View {
        HStack {
            VStack (alignment: .leading) {
                Text(liste.name)
                Text(" \(nbArticles) article\(nbArticles > 1 ? "s " : " ")").padding(3)                    .background(Color("ROUGE"))
                    .cornerRadius(8)
                    .foregroundColor(.white)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    var articles: [Article] = Article()
    
    ListeRow(liste: Liste(id:1, name: "Liste1", articles: articles))
}
