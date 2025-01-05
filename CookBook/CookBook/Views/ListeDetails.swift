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
    @State private var searchText = ""
    @State private var isSearchDialogPresented = false
    
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
        
        Spacer()
        
        HStack {
            Button(action: {
                isSearchDialogPresented = true 
            }) {
                SearchBar(search: $searchText)
            }
            Spacer()
            Button("+") {
                isSearchDialogPresented = true
            }
            .sheet(isPresented: $isSearchDialogPresented) {
                SearchDialogView(liste: $liste)
            }
        }
        .padding()
        .background(Color("FOND-SECONDAIRE"))
        .sheet(isPresented: $isSearchDialogPresented) {
            SearchDialogView(liste: $liste)
        }
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
