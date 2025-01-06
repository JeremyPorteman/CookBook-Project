//
//  Liste.swift
//  CookBook
//
//  Created by Cléa JAN on 14/12/2024.
//
// Objet Liste représentant une liste de course par exemple
// Elle est composée d'un id, d'un nom et d'une liste d'Articles

import Foundation
import CoreData

struct Liste : Hashable, Identifiable{
    var id : Int
    var name : String
    var articles : [Article]
}


 let listesFictives: [Liste] = [
 Liste(
 id: 1,
 name: "Courses de la semaine",
 articles: [
 //Article(id: 1, name: "Pommes", description: "Pommes rouges bio", categorie: "Fruits", imageName: ""),
    //Article(id: 2, name: "Lait", description: "Lait entier 1L", categorie: "Produits laitiers", imageName: ""),
    //Article(id: 3, name: "Pain", description: "Baguette tradition", categorie: "Boulangerie", imageName: "")
 ]
 ),
 Liste(
 id: 2,
 name: "Matériel pour le pique-nique",
 articles: [
    //Article(id: 4, name: "Assiettes jetables", description: "Assiettes en carton", categorie: "Accessoires", imageName: ""),
 //Article(id: 5, name: "Serviettes", description: "Paquet de serviettes", categorie: "Accessoires", imageName: "")
 ]
 ),
 Liste(
 id: 3,
 name: "Épicerie du mois",
 articles: [
    //Article(id: 6, name: "Riz", description: "Sachet de 1kg", categorie: "Épicerie", imageName: ""),
    //Article(id: 7, name: "Pâtes", description: "500g de spaghetti", categorie: "Épicerie", imageName: ""),
    //Article(id: 8, name: "Sauce tomate", description: "Bocal de 500ml", categorie: "Épicerie", imageName: ""),
    //Article(id: 9, name: "Huile d'olive", description: "Bouteille de 1L", categorie: "Épicerie", imageName: "")
 ]
 ),
 Liste(
 id: 4,
 name: "Matériel de bureau",
 articles: [
    //Article(id: 10, name: "Stylos", description: "Lot de 5 stylos bleus", categorie: "Papeterie", imageName: "")
 ]
 )
 ]
 
