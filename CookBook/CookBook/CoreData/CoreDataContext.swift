//
//  Context.swift
//  CookBook
//
//  Created by Jérémy PORTEMAN on 06/01/2025.
//

import Foundation
import CoreData


class CoreDataContext{
    
    static let shared = CoreDataContext()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CookBook")
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to load persistent stores: \(error)")
            }
        }
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
