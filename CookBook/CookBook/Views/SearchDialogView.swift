//
//  SearchDialogView.swift
//  CookBook
//
//  Created by Cléa JAN on 05/01/2025.
//

import SwiftUI

struct SearchDialogView: View {
    @Binding var liste: Liste
    @State private var selectedArticles: Set<Article> = []
    
    // Regroupement des articles par catégorie
    private var groupedArticles: [String: [Article]] {
        Dictionary(grouping: articlesFictifs, by: { $0.categorie })
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(groupedArticles.keys.sorted(), id: \.self) { categorie in
                    Section(header: Text(categorie).font(.headline)) {
                        ForEach(groupedArticles[categorie] ?? [], id: \.id) { article in
                            HStack {
                                Text(article.name)
                                Spacer()
                                Button(action: {
                                    toggleSelection(for: article)
                                }) {
                                    Image(systemName: selectedArticles.contains(article) ? "checkmark.square.fill" : "square")
                                        .foregroundColor(selectedArticles.contains(article) ? Color.green : .gray)
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
    
    private func toggleSelection(for article: Article) {
        if selectedArticles.contains(article) {
            selectedArticles.remove(article)
        } else {
            selectedArticles.insert(article)
        }
    }
    
    private func addSelectedArticles() {
        for article in selectedArticles {
            if !liste.articles.contains(where: { $0.id == article.id }) {
                liste.articles.append(article)
            }
        }
        dismiss()
    }
    
    
    // Fermer la boîte de dialogue
    private func dismiss() {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            windowScene.windows.first?.rootViewController?.dismiss(animated: true, completion: nil)
        }
    }
}

#Preview {
    var liste = Liste(id: 1, name: "Ma Liste", articles: [])
    return SearchDialogView(liste: .constant(liste))
}
