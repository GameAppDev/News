//
//  CoreDataManager.swift
//  News
//
//  Created by Oguzhan Yalcin on 16.09.2022.
//

import UIKit
import CoreData

final class CoreDataManager {
    
    public static let shared = CoreDataManager()
    
    public func getFavouriteNews() -> [NewsArticle] {
        var favNewsCoreData: [FavNews] = []
        
        do { favNewsCoreData = try managedContext.fetch(fetchRequestForRepository) }
        catch let error { debugPrint("<---! Get Fav Repos Error: \(error.localizedDescription) !--->") }
        
        let favNews: [NewsArticle] = favNewsCoreData.map({ model in
            NewsArticle(coreDataModel: model)
        })
        
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
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    var fetchRequest: NSFetchRequest<NSFetchRequestResult> {
        return NSFetchRequest<NSFetchRequestResult>(entityName: "FavNews")
    }
    
    var fetchRequestForRepository: NSFetchRequest<FavNews> {
        return FavNews.fetchRequest()
        //return NSFetchRequest<Repository>(entityName: "FavNews")
    }
}
