//
//  DonneesFictives.swift
//  CookBook
//
//  Created by Cléa JAN on 14/12/2024.
//

import Foundation

@Observable
class DonnesFictives {
    @Published var listes: [Liste]
    var articles: [Article]
    
    init() {
        self.listes = [] // Initialisation du tableau
        for cpt in 0..<10 {
            let liste = Liste(id: cpt, name: "Liste \(cpt)", articles: [])
            self.listes.append(liste)
        }
        
        /*self.articles = []
        for cpt in 0..<10 {
            let article = Article(id: cpt, name: "Article \(cpt)", description: "Lorem ipsum...", image: "image", categorie: "Alimentation")
            self.articles.append(article)
        }*/
    }
}
