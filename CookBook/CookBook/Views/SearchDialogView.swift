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
    
    // Regrouper les articles par catégorie
    var groupedArticles: [String: [Article]] {
        Dictionary(grouping: articlesFictifs, by: { $0.categorie })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(search: $searchQuery)
               
                List {
                    ForEach(groupedArticles.keys.sorted(), id: \.self) { categorie in
                        Section(header: Text(categorie).font(.headline)) {
                            ForEach(groupedArticles[categorie]!.filter {
                                searchQuery.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchQuery)
                            }) { article in
                                HStack {
                                    Button(action: {
                                        toggleSelection(for: article)
                                    }) {
                                        Image(systemName: selectedArticles.contains(article.id) ? "checkmark.circle.fill" : "circle")
                                            .foregroundColor(selectedArticles.contains(article.id) ? .green : .gray)
                                    }
                                    Text(article.name)
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
        }
    }
    
    // ✅ Basculer la sélection d'un article
    private func toggleSelection(for article: Article) {
        if selectedArticles.contains(article.id) {
            selectedArticles.remove(article.id)
        } else {
            selectedArticles.insert(article.id)
        }
    }
    
    // ✅ Ajouter tous les articles sélectionnés
    private func addSelectedArticles() {
        let newArticles = articlesFictifs.filter { selectedArticles.contains($0.id) }
        
        for article in newArticles {
            if !liste.articles.contains(where: { $0.id == article.id }) {
                liste.articles.append(article)
            }
        }
        
        selectedArticles.removeAll() // Réinitialiser après l'ajout
        dismiss()
    }
    
    // ✅ Fermer la boîte de dialogue
    private func dismiss() {
        UIApplication.shared.windows.first?.rootViewController?.dismiss(animated: true)
    }
}

#Preview {
    var liste = Liste(id: 1, name: "Ma Liste", articles: [])
    return SearchDialogView(liste: .constant(liste))
}
