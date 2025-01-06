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
            // AFFICHAGE : NOM DE LA LISTE
            HStack {
                Spacer()
                Text(liste.name).font(.headline)
                Spacer()
            }
            .padding(5)
            .background(Color("FOND-SECONDAIRE"))
             
            // AFFICHAGE DE LA LISTE
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
                        
                        Spacer()
                        
                        Button(action: {
                            removeArticle(article)
                        }) {
                            Image(systemName: "trash")
                                .foregroundColor(Color("ROUGE"))
                        }
                        .buttonStyle(BorderlessButtonStyle()) // Permet au bouton d'être réactif dans une liste
                                 
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
    
    // Fonction pour supprimer un article de la liste
    private func removeArticle(_ article: Article) {
        if let index = liste.articles.firstIndex(where: { $0.id == article.id }) {
            liste.articles.remove(at: index)
        }
    }
}

#Preview {
    var articles: [Article] = articlesFictifs
    var liste = Liste(id:0, name: "Course Maison", articles: articles)
    ListeDetails(liste: liste)
}
