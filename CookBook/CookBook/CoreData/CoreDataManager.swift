//
//  CoreDataManager.swift
//  CookBook
//
//  Created by Jérémy PORTEMAN on 05/01/2025.
//

import CoreData

class CoreDataManager {
    
    let context = CoreDataContext().context

    // MARK: - CRUD Operations
    
    
    func saveArticle(id: Int, name: String, description: String, category: String, imageName: String, variable: String) {
        let article = Article(context: context)
        article.id = Int32(id)
        article.name = name
        article.articleDescription = description
        article.categorie = category
        article.imageName = imageName
        
        saveContext()
    }
    
    func fetchArticles() -> [Article] {
        let request: NSFetchRequest<Article> = Article.fetchRequest()
        
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching articles: \(error)")
            return []
        }
    }
    
    func deleteArticle(_ article: Article) {
        context.delete(article)
        saveContext()
    }
    
    func updateArticle(_ article: Article) {
        saveContext()
    }
    
    // MARK: - Core Data Saving Support
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
