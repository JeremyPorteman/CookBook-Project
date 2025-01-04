//
//  ListeDetails.swift
//  CookBook
//
//  Created by Cléa JAN on 12/12/2024.
//

import SwiftUI

struct ListeDetails: View {
   
    @State var liste: Liste
    @State private var checkedArticles: Set<Int> = []
    
    var body: some View {
     
        VStack {
            HStack {
                Spacer()
                Text(liste.name)
                Spacer()
            }
            .padding(5)
            .background(Color("FOND-SECONDAIRE"))
               
            List {
                ForEach(liste.articles) { article in
                    HStack {
                        // Case à cocher
                        Button(action: {
                            toggleCheck(for: article)
                        })
                        {
                            Image(systemName: checkedArticles.contains(article.id) ? "checkmark.square.fill" : "square")
                                .foregroundColor(checkedArticles.contains(article.id) ? Color("VERT") : .gray)
                        }
                        Text(article.name)
                    }
                }
            }
            .listStyle(.plain)
        }
        //.padding()
        //.navigationTitle(liste.name)
        
        Spacer()
        
        HStack {
            SearchBar()
            Spacer()
            Button("+") {
                
            }
        }.padding().background(Color("FOND-SECONDAIRE"))
    }
    
    // Fonction pour basculer l'état coché
    private func toggleCheck(for article: Article) {
        if checkedArticles.contains(article.id) {
            checkedArticles.remove(article.id)
        } else {
            checkedArticles.insert(article.id)
        }
    }
}

#Preview {
    var articles: [Article] = articlesFictifs
    var liste = Liste(id:0, name: "Course Maison", articles: articles)
    ListeDetails(liste: liste)
}
