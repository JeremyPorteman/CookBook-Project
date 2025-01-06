//
//  CookBookApp.swift
//  CookBook
//
//  Created by Jérémy PORTEMAN on 29/11/2024.
//

import SwiftUI

@main
struct CookBookApp: App {
    let persistentContainer = CoreDataManager.shared.persistentContainer

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
