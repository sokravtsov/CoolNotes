//
//  Notebook+CoreDataClass.swift
//  Cool Notes
//
//  Created by Sergey Kravtsov on 11.03.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import Foundation
import CoreData

// MARK: - Notebook: NSManagedObject
public class Notebook: NSManagedObject {

    // MARK: - Initializer
    
    convenience init(name: String, context: NSManagedObjectContext) {
        
        if let ent = NSEntityDescription.entity(forEntityName: "Notebook", in: context) {
            self.init(entity: ent, insertInto: context)
            self.name = name;
            self.creationDate = Date()
        } else {
            fatalError("Unable to find Entity name!")
        }
    }
    
    var humanReadableAge: String {
        get {
            let fmt = DateFormatter()
            fmt.timeStyle = .none
            fmt.dateStyle = .short
            fmt.doesRelativeDateFormatting = true
            fmt.locale = Locale.current
            return fmt.string(from: creationDate!)
        }
    }
}
