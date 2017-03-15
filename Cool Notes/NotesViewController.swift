//
//  NotesViewController.swift
//  Cool Notes
//
//  Created by Sergey Kravtsov on 16.03.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: CoreDataTableViewController {
    
    // MARK: TableView Data Source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get the note
        let note = fetchedResultsController?.object(at: indexPath) as! Note
        
        // Get the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Note", for: indexPath)
        
        // Sync note -> cell
        cell.textLabel?.text = note.text
        
        // Return the cell
        return cell
    }
}
