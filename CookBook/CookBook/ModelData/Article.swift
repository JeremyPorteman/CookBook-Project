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
    Article(
        id: 1,
        name: "Pommes",
        description: "Pommes fraîches et croquantes.",
        categorie: "Fruits",
        imageName: "apple"
    ),
    Article(
        id: 2,
        name: "Bananes",
        description: "Bananes riches en potassium.",
        categorie: "Fruits",
        imageName: "banana"
    ),
    Article(
        id: 3,
        name: "Pain",
        description: "Pain complet bio.",
        categorie: "Boulangerie",
        imageName: "bread"
    ),
    Article(
        id: 4,
        name: "Lait",
        description: "Lait demi-écrémé.",
        categorie: "Produits laitiers",
        imageName: "milk"
    ),
    Article(
        id: 5,
        name: "Œufs",
        description: "Œufs fermiers bio.",
        categorie: "Produits frais",
        imageName: "eggs"
    ),
    Article(
        id: 6,
        name: "Tomates",
        description: "Tomates cerises sucrées.",
        categorie: "Légumes",
        imageName: "tomato"
    ),
    Article(
        id: 7,
        name: "Poulet",
        description: "Blanc de poulet frais.",
        categorie: "Viande",
        imageName: "chicken"
    ),
    Article(
        id: 8,
        name: "Riz",
        description: "Riz basmati parfumé.",
        categorie: "Épicerie",
        imageName: "rice"
    ),
    Article(
        id: 9,
        name: "Beurre",
        description: "Beurre salé.",
        categorie: "Produits laitiers",
        imageName: "butter"
    ),
    Article(
        id: 10,
        name: "Yaourt",
        description: "Yaourt nature sans sucre.",
        categorie: "Produits laitiers",
        imageName: "yogurt"
    ),
    Article(
        id: 11,
        name: "Pâtes",
        description: "Pâtes fraiches d'italie",
        categorie: "Épicerie",
        imageName: "pasta"
    ),
]
