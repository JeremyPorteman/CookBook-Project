//
//  Article.swift
//  CookBook
//
//  Created by Cléa JAN on 14/12/2024.
//
//  Objet Article représentant un éléments dans liste de course
//  Par exemple, un article peut être une pomme, ou du lait, etc...

import Foundation
import SwiftUI

struct Article : Hashable, Codable, Identifiable{
    var id : Int
    var name : String
    var description : String
    var categorie : String
    var imageName : String
    
    private var image: Image {
        Image(imageName)
    }
    
    var isChecked: Bool = false
}

let articlesFictifs: [Article] = [
    Article(id: 1, name: "Banane", description: "Fruit jaune", categorie: "Fruit", imageName: "b"),
    Article(id: 2, name: "Courgette", description: "Legume vert", categorie: "Légumes", imageName: "c"),
    Article(id: 3, name: "Stylo", description: "bic classique", categorie: "Bureau", imageName: "s"),
    Article(id: 4, name: "Lait", description: "lorem ipsum", categorie: "Produits laitiers", imageName: "l"),
    Article(id: 5, name: "Pizza", description: "lorem ipsum", categorie: "Italie", imageName: "p"),
]
