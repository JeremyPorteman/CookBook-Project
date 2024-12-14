//
//  ListeDetails.swift
//  CookBook
//
//  Created by Cléa JAN on 12/12/2024.
//

import SwiftUI

struct ListeDetails: View {
   
    var liste: Liste
        
    init(_ liste: Liste) {
        self.liste = liste
    }
    
    var body: some View {
        HStack {
            Text("Editer")
            Spacer()
            Text(liste.name).font(.title)
            Spacer()
            Image("Icons/more-vertical")
        }.padding().background(Color("FOND-SECONDAIRE"))
        
        Spacer()
        
        HStack {
            SearchBar()
            Spacer()
            Button("+") {
                
            }
        }.padding().background(Color("FOND-SECONDAIRE"))
    }
}

#Preview {
    var liste = Liste(id:0, name: "Course Maison", articles:[])
    ListeDetails(liste)
}
