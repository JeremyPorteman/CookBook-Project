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
