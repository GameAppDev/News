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
        var news: [NewsArticle] = []
        
        do {
            let fetchResults = try managedContext.fetch(fetchRequest)
            
            for result in fetchResults as! [NSManagedObject] {
                let favNews = NewsArticle(
                    source: NewsSource(name: result.value(forKey: "name") as? String),
                    author: result.value(forKey: "author") as? String,
                    title: result.value(forKey: "title") as? String,
                    description: result.value(forKey: "desc") as? String,
                    url: result.value(forKey: "url") as? String,
                    urlToImage: result.value(forKey: "urlToImage") as? String,
                    publishedAt: result.value(forKey: "publishedAt") as? String,
                    content: result.value(forKey: "content") as? String
                )
                news.append(favNews)
            }
        }
        catch let error { debugPrint(error.localizedDescription) }
        
        return news
    }
    
    public func getSelectedNewsStatus(_ news: NewsArticle) -> Bool {
        let favNews:[NewsArticle] = getFavouriteNews()
        
        if (favNews.first(where: {$0.title == news.title}) != nil) {
            return true
        }
        return false
    }
    
    public func setFavouriteNews(with news: NewsArticle, isFav: Bool) {
        isFav ? (addNews(news)) : (removeNews(news))
    }
    
    private func addNews(_ news: NewsArticle) {
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
        catch let error { debugPrint(error.localizedDescription) }
    }
    
    private func removeNews(_ news: NewsArticle) {
        do {
            let fetchResults = try managedContext.fetch(fetchRequest)
            
            for result in fetchResults as! [NSManagedObject] {
                let title = result.value(forKey: "title") as? String
                if news.title == title {
                    managedContext.delete(result)
                }
            }
            try managedContext.save()
        }
        catch let error { debugPrint(error.localizedDescription) }
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
