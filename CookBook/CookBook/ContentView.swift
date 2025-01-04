//
//  ContentView.swift
//  CookBook
//
//  Created by Jérémy PORTEMAN on 29/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var listes: [Liste] = listesFictives
    @State private var showAddListSheet = false // Contrôle l'affichage de la feuille modale
    @State private var newListName = ""
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(listes) { liste in
                    NavigationLink {
                        ListeDetails(liste: liste)
                    } label: {
                        ListeRow(liste: liste)
                    }
                }
                
                // Bouton pour ajouter une nouvelle liste
                Button(action: {
                    showAddListSheet = true // Affiche la boîte de dialogue
                }) {
                    HStack {
                        Image("Icons/plus")
                            .background(Color("FOND-PRIMAIRE"))
                            .clipShape(Circle())
                        Text("Ajouter une liste")
                    }
                    .foregroundStyle(Color("TEXTE"))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color("FOND-SECONDAIRE"))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                }
            }
            .navigationTitle("Mes Listes")
        } detail: {
            Text("Sélectionnez une liste")
        }
        // Feuille modale pour ajouter une nouvelle liste
        .sheet(isPresented: $showAddListSheet) {
            VStack {
                Text("Nouvelle Liste")
                    .font(.title)
                    .padding()
                
                TextField("Nom de la liste", text: $newListName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                HStack {
                    Button("Annuler") {
                        showAddListSheet = false
                        newListName = "" // Réinitialise le nom
                    }
                    .foregroundColor(Color("ROUGE"))
                    
                    Spacer()
                    
                    Button("Ajouter") {
                        ajouterNouvelleListe()
                        showAddListSheet = false
                        newListName = ""
                    }
                    .disabled(newListName.isEmpty) // Désactive si le champ est vide
    
                }
                .padding()
            }
            .padding()
        }
    }
    
    // Fonction pour ajouter une nouvelle liste
    private func ajouterNouvelleListe() {
        let nouvelleListe = Liste(
            id: (listes.last?.id ?? 0) + 1,
            name: newListName,
            articles: []
        )
        listes.append(nouvelleListe)
    }
}

#Preview {
    ContentView()
}
