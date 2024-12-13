//
//  ListeDetails.swift
//  CookBook
//
//  Created by Cléa JAN on 12/12/2024.
//

import SwiftUI

struct ListeDetails: View {
    var body: some View {
        HStack {
            Text("Editer")
            Spacer()
            Text("Nom de la liste").font(.title)
            Spacer()
            Text("Actions")
        }.padding().background(Color.gray)
        
        Spacer()
        
        HStack {
            Text("Barre de recherche")
            Spacer()
            Button("+") {
                
            }
        }.padding()
    }
}

#Preview {
    ListeDetails()
}
