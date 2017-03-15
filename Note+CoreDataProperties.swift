//
//  Note+CoreDataProperties.swift
//  Cool Notes
//
//  Created by Sergey Kravtsov on 11.03.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation
import CoreData


extension Note {

    @NSManaged public var creationDate: Date?
    @NSManaged public var text: String?
    @NSManaged public var notebook: NSManagedObject?

}
