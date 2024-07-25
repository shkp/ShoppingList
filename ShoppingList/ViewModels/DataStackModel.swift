//
//  DataStackModel.swift
//  ShoppingList
//
//  Created by Sumukha Kashyap on 24.07.24.
//

import Foundation
import CoreData

class DataStackModel: ObservableObject{
    let itemsPersistentContainer: NSPersistentContainer
    @Published var savedArticles: [ArticleEntity] = []
    
    init() {
        itemsPersistentContainer = NSPersistentContainer(name: "ArticlesContainer")
        itemsPersistentContainer.loadPersistentStores { (description, error) in
            if let error = error{
                print("ERROR LOADING CORE DATA: \(error)")
            }
        }
        
        fetchArticles()
        
    }
    
    func fetchArticles(){
        let fetchArticlesrequest = NSFetchRequest<ArticleEntity>(entityName: "ArticleEntity")
        
        do{
            savedArticles = try itemsPersistentContainer.viewContext.fetch(fetchArticlesrequest)
        } catch let error {
            print("Error fetching data: \(error)")
        }
    }
    
    
    func addArticle(name: String, quantity: String ){
        let newArticle = ArticleEntity(context: itemsPersistentContainer.viewContext)
        newArticle.name = name
        newArticle.standardQuantityInGms = quantity
        saveArticles()
        
    }
    
    func saveArticles(){
        do{
            try itemsPersistentContainer.viewContext.save()
            fetchArticles()
        } catch let error {
            print("Error saving data: \(error)")
        }
        
    }
}
