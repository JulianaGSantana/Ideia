//
//  CoreDataStack.swift
//  Ideia
//
//  Created by Juliana Santana on 29/07/21.
//

import CoreData
class CoreDataStack {
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Model")
        container.loadPersistentStores { _, error in
            if let erro = error{
                preconditionFailure(erro.localizedDescription)
            }
            
        }
        return container
    }()
}
