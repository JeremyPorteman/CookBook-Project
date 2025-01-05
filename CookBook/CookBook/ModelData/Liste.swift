//
//  Liste.swift
//  CookBook
//
//  Created by Cléa JAN on 14/12/2024.
//
// Objet Liste représentant une liste de course par exemple
// Elle est composée d'un id, d'un nom et d'une liste d'Articles

import Foundation

struct Liste : Hashable, Codable, Identifiable{
    var id : Int
    var name : String
    var articles : [Article]
}

let listesFictives: [Liste] = [
    Liste(
        id: 1,
        name: "Courses de la semaine",
        articles: articlesFictifs.filter { [1, 4, 3].contains($0.id) }
    ),
    Liste(
        id: 2,
        name: "Matériel pour le pique-nique",
        articles: articlesFictifs.filter { [12, 13].contains($0.id) }
    ),
    Liste(
        id: 3,
        name: "Épicerie du mois",
        articles: articlesFictifs.filter { [8, 11, 14, 15].contains($0.id) }
    ),
    Liste(
        id: 4,
        name: "Matériel de bureau",
        articles: articlesFictifs.filter { [16].contains($0.id) }
    )
]
