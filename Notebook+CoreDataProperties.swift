//
//  Notebook+CoreDataProperties.swift
//  Cool Notes
//
//  Created by Sergey Kravtsov on 11.03.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation
import CoreData


extension Notebook {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notebook> {
        return NSFetchRequest<Notebook>(entityName: "Notebook");
    }

    @NSManaged public var creationDate: Date?
    @NSManaged public var name: String?
    @NSManaged public var notes: NSSet?

}
