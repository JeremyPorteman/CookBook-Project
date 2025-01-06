//
//  SearchDialogView.swift
//  CookBook
//
//  Created by Cléa JAN on 05/01/2025.
//

import SwiftUI

struct SearchDialogView: View {
    
    @Binding var liste: Liste
    @State private var searchQuery = ""
    @State private var selectedArticles: Set<Int> = []
    @State private var newArticleName: String = ""
    @State private var newArticleDescription: String = ""
    @State private var selectedCategoryForNewArticle: String = ""
    @State private var isAddingNewArticle = false
    
    // Regrouper les articles par catégorie
    var groupedArticles: [String: [Article]] {
        Dictionary(grouping: articlesFictifs, by: { $0.categorie })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Barre de recherche
                SearchBar(search: $searchQuery)
                
                List {
                    ForEach(groupedArticles.keys.sorted(), id: \.self) { categorie in
                        Section(header: HStack {
                            Text(categorie).font(.headline)
                            Spacer()
                            Button(action: {
                                selectedCategoryForNewArticle = categorie
                                isAddingNewArticle = true
                            }) {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(Color("VERT"))
                            }
                        }) {
                            ForEach(groupedArticles[categorie]!.filter {
                                searchQuery.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchQuery)
                            }) { article in
                                HStack {
                                    VStack (alignment: .leading){
                                        HStack {
                                            Button(action: {
                                                toggleSelection(for: article)
                                            }) {
                                                Image(systemName: selectedArticles.contains(article.id) ? "checkmark.circle.fill" : "circle")
                                                    .foregroundColor(selectedArticles.contains(article.id) ? Color("VERT") : .gray)
                                            }
                                            Text(article.name)
                                            Spacer()
                                            
                                                                                }
                                        Text(article.description).font(.subheadline).foregroundColor(.gray)
                                    }
                                    Image("Images-item/\(article.imageName)")
                                        .resizable()
                                        .frame(width: 50, height: 50)
                                        .background(Color("VERT"))
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Ajouter des articles")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Ajouter") {
                        addSelectedArticles()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Annuler") {
                        dismiss()
                    }
                }
            }
        }.alert("Nouvel article", isPresented: $isAddingNewArticle, actions: {
            TextField("Nom de l'article", text: $newArticleName)
            TextField("Description de l'article", text: $newArticleDescription)
            Button("Ajouter", action: addNewArticle)
            Button("Annuler", role: .cancel, action: {})
        }, message: {
            Text("Entrez le nom d'un nouvel article pour \(selectedCategoryForNewArticle).")
        })
    }
    
    // Fonction pour basculer la sélection des articles
    private func toggleSelection(for article: Article) {
        if selectedArticles.contains(article.id) {
            selectedArticles.remove(article.id)
        } else {
            selectedArticles.insert(article.id)
        }
    }
    
    // Ajouter les articles sélectionnés à la liste
    private func addSelectedArticles() {
        let newArticles = articlesFictifs.filter { selectedArticles.contains($0.id) }
        liste.articles.append(contentsOf: newArticles)
        dismiss()
    }
    
    // Ajouter un nouvel article
    func addNewArticle() {
        // Vérifier que le champs nom n'est pas vide
        guard !newArticleName.isEmpty else { return }
        
        let newId = articlesFictifs.count + 1
        let newArticle = Article(id: newId, name: newArticleName, description: newArticleDescription, categorie: selectedCategoryForNewArticle, imageName:"")
        
        liste.articles.append(newArticle)
        articlesFictifs.append(newArticle) // Optionnel : Ajouter dans les articles fictifs globaux
        
        newArticleName = ""
        selectedCategoryForNewArticle = ""
    }
    

    // Fermer la boîte de dialogue
    private func dismiss() {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
    }
}

#Preview {
    var liste = Liste(id: 1, name: "Ma Liste", articles: [])
    return SearchDialogView(liste: .constant(liste))
}

