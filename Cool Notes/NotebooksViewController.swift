//
//  NotebooksTableViewController.swift
//  Cool Notes
//
//  Created by Sergey Kravtsov on 16.03.17.
//  Copyright © 2017 Sergey Kravtsov. All rights reserved.
//

import UIKit
import CoreData

class NotebooksViewController: CoreDataTableViewController {
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the title
        title = "CoolNotes"
        
        // Get the stack
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let stack = delegate.stack
        
        // Create a fetchrequest
        let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Notebook")
        fr.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true),
                              NSSortDescriptor(key: "creationDate", ascending: false)]
        
        // Create the FetchedResultsController
        fetchedResultsController = NSFetchedResultsController(fetchRequest: fr, managedObjectContext: stack.context, sectionNameKeyPath: nil, cacheName: nil)
    }
    
    @IBAction func addNewNotebook(_ sender: UIBarButtonItem) {
        // Create a new notebook... and Core Data takes care of the rest!
        let nb = Notebook(name: "New Notebook", context: fetchedResultsController!.managedObjectContext)
        print("Just created a notebook: \(nb)")

    }
    
    
    // MARK: TableView Data Source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Find the right notebook for this indexpath
        let nb = fetchedResultsController!.object(at: indexPath) as! Notebook
        
        // Create the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotebookCell", for: indexPath)
        
        // Sync notebook -> cell
        cell.textLabel?.text = nb.name
        cell.detailTextLabel?.text = "\(nb.notes!.count) notes"
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier! == "displayNote" {
            
            if let notesVC = segue.destination as? NotesViewController {
                
                // Create Fetch Request
                let fr = NSFetchRequest<NSFetchRequestResult>(entityName: "Note")
                
                fr.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false),NSSortDescriptor(key: "text", ascending: true)]
                
                let indexPath = tableView.indexPathForSelectedRow!
                let notebook = fetchedResultsController?.object(at: indexPath)
                
                let pred = NSPredicate(format: "notebook = %@", argumentArray: [notebook!])
                
                fr.predicate = pred
                
                // Create FetchedResultsController
                let fc = NSFetchedResultsController(fetchRequest: fr, managedObjectContext:fetchedResultsController!.managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
                
                // Inject it into the notesVC
                notesVC.fetchedResultsController = fc
            }
        }
    }
}
