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
    
    private var imageName : String
    
    var image: Image {
        Image(imageName)
    }
}
