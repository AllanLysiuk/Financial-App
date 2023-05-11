//
//  CoreDataStack.swift
//  BudgetApp
//
//  Created by Allan on 22.04.23.
//

import Foundation

import CoreData

final class CoreDataStack {
  
    private init() { }
    
    static var shared: CoreDataStack = CoreDataStack()
    
     var mainContext : NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
     lazy var backgroundContext: NSManagedObjectContext = {
         let context = persistentContainer.newBackgroundContext()
        context.parent = mainContext
        return context
    }()

     private var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Categories")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()

    func saveContext(context: NSManagedObjectContext) {
       let context = context
       if context.hasChanges{
       do {
           try context.save()
       } catch let error as NSError {
           print("Unresolved error \(error), \(error.userInfo)")
       }
       }
   }
}
