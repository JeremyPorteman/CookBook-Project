//
//  ContentView.swift
//  CookBook
//
//  Created by Jérémy PORTEMAN on 29/11/2024.
//

import SwiftUI

struct ContentView: View {
    
    var listes: [Liste] = listesFictives
    
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
              
                Button(action: {}) {
                    HStack {
                        Image("Icons/plus")
                            .background(Color("FOND-SECONDAIRE"))
                            .clipShape(Circle())
                        Text("Ajouter une liste")
                    }
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, alignment: .center) // S'étend horizontalement
                    .padding()
                    .background(Color("FOND-PRIMAIRE"))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 5)
                }
               
            }.navigationTitle("Mes Listes")
        } detail: {
            Text("Selectionner une liste")
        }
        
    }
}

#Preview {
    ContentView()
}
