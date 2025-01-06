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
        Image("Images-item/\(imageName)")
    }
    
    var isChecked: Bool = false
}

var articlesFictifs: [Article] = [
    Article(id: 1, name: "Pommes", description: "Pommes fraîches et croquantes.", categorie: "Fruits", imageName: "pommes"),
    Article(id: 2, name: "Bananes", description: "Bananes riches en potassium.", categorie: "Fruits", imageName: "banane"),
    Article(id: 3, name: "Pain", description: "Pain complet bio.", categorie: "Boulangerie", imageName: "baguette"),
    Article(id: 4, name: "Lait", description: "Lait demi-écrémé.", categorie: "Produits laitiers", imageName: "lait"),
    Article(id: 5, name: "Œufs", description: "Œufs fermiers bio.", categorie: "Produits frais", imageName: "oeufs"),
    Article(id: 6, name: "Tomates", description: "Tomates cerises sucrées.", categorie: "Légumes", imageName: "tomates"),
    Article(id: 7, name: "Poulet", description: "Blanc de poulet frais.", categorie: "Viande", imageName: "poulet"),
    Article(id: 8, name: "Riz", description: "Riz basmati parfumé.", categorie: "Épicerie", imageName: "riz"),
    Article(id: 9, name: "Beurre", description: "Beurre salé.", categorie: "Produits laitiers", imageName: "beurre"),
    Article(id: 10, name: "Yaourt", description: "Yaourt nature sans sucre.", categorie: "Produits laitiers", imageName: "yaourt"),
    Article(id: 11, name: "Pâtes", description: "Pâtes fraîches d'Italie.", categorie: "Épicerie", imageName: "pasta"),
    Article(id: 12, name: "Assiettes jetables", description: "Assiettes en carton", categorie: "Accessoires", imageName: "a"),
    Article(id: 13, name: "Serviettes", description: "Paquet de serviettes", categorie: "Accessoires", imageName: "servietten"),
    Article(id: 14, name: "Sauce tomate", description: "Bocal de 500ml", categorie: "Épicerie", imageName: "sauce_tomate"),
    Article(id: 15, name: "Huile d'olive", description: "Bouteille de 1L", categorie: "Épicerie", imageName: "huile_olive"),
    Article(id: 16, name: "Stylos", description: "Lot de 5 stylos bleus", categorie: "Papeterie", imageName: "stylo")
]
