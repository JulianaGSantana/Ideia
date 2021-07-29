//
//  Page+CoreDataProperties.swift
//  Ideia
//
//  Created by Juliana Santana on 29/07/21.
//
//

import Foundation
import CoreData


extension Page {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Page> {
        return NSFetchRequest<Page>(entityName: "Page")
    }

    @NSManaged public var pageImage: String?
    @NSManaged public var note: Note?

}

extension Page : Identifiable {

}
