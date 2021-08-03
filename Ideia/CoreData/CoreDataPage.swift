//
//  CoreDataPage.swift
//  Ideia
//
//  Created by Juliana Santana on 28/07/21.
//

import CoreData
class CoreDataStackPage {

    static var persistentContainer: NSPersistentContainer = CoreDataStack.persistentContainer
    static var context: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    static func saveContext() throws{
        if context.hasChanges{
            try context.save()
        }
    }
    
    static func createPage(pageImage: String, note: Note) throws -> Page{
       // guard let page = NSEntityDescription.insertNewObject(forEntityName: "Page", into: context) as? Page else {preconditionFailure()}
        let page = Page(context: context)
        
        page.pageImage = pageImage
        note.addToPages(page)
        try saveContext()
        return page
    }
    
    static func getPage() throws -> [Page] {
        return try context.fetch(Page.fetchRequest())
    }
    
    static func deletePage(page: Page) throws{
        context.delete(page)
        try saveContext()
    }
}

