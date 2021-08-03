//
//  CoreDataNote.swift
//  Ideia
//
//  Created by Juliana Santana on 28/07/21.
//

import CoreData
class CoreDataStackNote {
    
    static var persistentContainer: NSPersistentContainer = CoreDataStack.persistentContainer
    
    static var context: NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    
    static func saveContext() throws{
        if context.hasChanges{
            try context.save()
        }
    }
    
    static func createNote(noteImage: String) throws -> Note{
        //guard let note = NSEntityDescription.insertNewObject(forEntityName: "Note", into: context) as? Note else {preconditionFailure()}
        let note = Note(context: context)
        note.noteImage = noteImage
        try saveContext()
        return note
    }
    
    static func getNote() throws -> [Note] {
        return try context.fetch(Note.fetchRequest())
    }
    
    static func deleteNote(note: Note) throws{
        context.delete(note)
        try saveContext()
    }
}
