//
//  CoreDataManager.swift
//  News
//
//  Created by Oguzhan Yalcin on 16.09.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    
    public func getFavouriteNews() -> [NewsArticle] {
        var favNews: [NewsArticle] = []
        
        do {
            if let fetchResults = try managedContext.fetch(fetchRequest) as? [NSManagedObject] {
                for result in fetchResults {
                    let news = NewsArticle(
                        source: NewsSource(name: result.value(forKey: "name") as? String),
                        author: result.value(forKey: "author") as? String,
                        title: result.value(forKey: "title") as? String,
                        description: result.value(forKey: "desc") as? String,
                        url: result.value(forKey: "url") as? String,
                        urlToImage: result.value(forKey: "urlToImage") as? String,
                        publishedAt: result.value(forKey: "publishedAt") as? String,
                        content: result.value(forKey: "content") as? String
                    )
                    favNews.append(news)
                }
            }
        }
        catch let error { debugPrint("<---! Get Fav News Error: \(error.localizedDescription) !--->") }
        
        return favNews
    }
    
    public func getSelectedNewsStatus(_ news: NewsArticle) -> Bool {
        let favNews:[NewsArticle] = getFavouriteNews()
        
        if (favNews.first(where: {$0.title == news.title}) != nil) {
            return true
        }
        return false
    }
    
    public func setFavouriteNews(with news: NewsArticle, isFav: Bool) {
        isFav ? (addNewsToFav(news)) : (removeNewsFromFav(news))
    }
    
    private func addNewsToFav(_ news: NewsArticle) {
        guard let entity = NSEntityDescription.entity(forEntityName: "FavNews", in: managedContext) else { return }
        
        let item = NSManagedObject(entity: entity, insertInto: managedContext)
        
        item.setValue(news.source?.name, forKey: "name")
        item.setValue(news.author, forKey: "author")
        item.setValue(news.title, forKey: "title")
        item.setValue(news.description, forKey: "desc")
        item.setValue(news.url, forKey: "url")
        item.setValue(news.urlToImage, forKey: "urlToImage")
        item.setValue(news.publishedAt, forKey: "publishedAt")
        item.setValue(news.content, forKey: "content")
        
        do { try managedContext.save() }
        catch let error { debugPrint("<---! Add Fav News Error: \(error.localizedDescription) !--->") }
    }
    
    private func removeNewsFromFav(_ news: NewsArticle) {
        do {
            if let fetchResults = try managedContext.fetch(fetchRequest) as? [NSManagedObject] {
                for result in fetchResults {
                    let title = result.value(forKey: "title") as? String
                    if news.title == title {
                        managedContext.delete(result)
                    }
                }
                try managedContext.save()
            }
        }
        catch let error { debugPrint("<---! Remove Fav News Error: \(error.localizedDescription) !--->") }
    }
}

extension CoreDataManager {
    
    var managedContext: NSManagedObjectContext {
        return appDelegate.persistentContainer.viewContext
    }
    
    var fetchRequest: NSFetchRequest<NSFetchRequestResult> {
        return NSFetchRequest<NSFetchRequestResult>(entityName: "FavNews")
    }
}
