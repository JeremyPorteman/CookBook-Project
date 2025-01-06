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
    @State private var isRenameDialogPresented = false
    @State private var newListName: String = ""
    
    var onDelete: ((Liste) -> Void)? // Closure pour informer ContentView de la suppression
    
    var body: some View {
     
        VStack {
            // AFFICHAGE : NOM DE LA LISTE
            HStack {
                Spacer()
                Text(liste.name).font(.headline)
                Spacer()
                
                // Bouton Menu
                Menu {
                   Button(action: {
                       isRenameDialogPresented = true
                       newListName = liste.name
                   }) {
                       Label("Renommer", systemImage: "pencil")
                   }
                   
                   Button(role: .destructive) {
                       supprimerListe()
                   } label: {
                       Label("Supprimer", systemImage: "trash")
                   }
               } label: {
                   Image(systemName: "ellipsis.circle")
                       .font(.title2)
                       .foregroundColor(.gray)
               }
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
            .sheet(isPresented: $isRenameDialogPresented) {
               renameDialog()
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
    
    // Fonction pour supprimer la liste
    private func supprimerListe() {
        onDelete?(liste)
    }
       
   // Fonction pour renommer la liste
   @ViewBuilder
   private func renameDialog() -> some View {
       VStack(spacing: 20) {
           Text("Renommer la liste")
               .font(.headline)
           
           TextField("Nouveau nom", text: $newListName)
               .textFieldStyle(RoundedBorderTextFieldStyle())
               .padding()
           
           HStack {
               Button("Annuler") {
                   isRenameDialogPresented = false
               }
               .foregroundColor(.red)
               
               Spacer()
               
               Button("Valider") {
                   if !newListName.isEmpty {
                       liste.name = newListName
                       isRenameDialogPresented = false
                   }
               }
               .foregroundColor(.blue)
           }
           .padding()
       }
       .padding()
       .presentationDetents([.medium])
   }
}

#Preview {
    var articles: [Article] = articlesFictifs
    var liste = Liste(id:0, name: "Course Maison", articles: articles)
    ListeDetails(liste: liste)
}
