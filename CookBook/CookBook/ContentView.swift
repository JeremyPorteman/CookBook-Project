//
//  ContentView.swift
//  CookBook
//
//  Created by Jérémy PORTEMAN on 29/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Text("Mes Listes")
            Spacer()
            Text("Editer")
        }.padding()
        
        List {
            ForEach(0..<10) { cpt in
                ListeRow(nomListe: "Liste \(cpt+1)", nbArticles: cpt+1)
            }
        }.navigationTitle("Mes Listes")
        
        
    }
}

#Preview {
    ContentView()
}
