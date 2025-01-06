//
//  ArticleService.swift
//  CookBook
//
//  Created by Jérémy PORTEMAN on 05/01/2025.
//

import CoreData
import Foundation

class CoreDataService {
    private let viewContext: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.viewContext = context
    }

    // Fetch a single item by a unique attribute
    func fetchItem(byId id: UUID) -> Article? {
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        fetchRequest.fetchLimit = 1

        do {
            let results = try viewContext.fetch(fetchRequest)
            return results.first
        } catch {
            print("Failed to fetch item with id \(id): \(error)")
            return nil
        }
    }

    // Fetch all items
    func fetchAllItems() -> [Article] {
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()

        do {
            return try viewContext.fetch(fetchRequest)
        } catch {
            print("Failed to fetch items: \(error)")
            return []
        }
    }

    // Save context after any changes
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
