//
//  ViewController.swift
//  Tasker
//
//  Created by Denis Filipas on 1/7/19.
//  Copyright © 2019 Denis Filipas. All rights reserved.
//

import UIKit
import CoreData

private let taskCellIdentifier = "TaskCellID"
private let segueAddNewTask = "AddNewTask"

class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate {
    
    var fetchController: NSFetchedResultsController<Task>!
    
    @IBOutlet weak var taskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request: NSFetchRequest<Task> = Task.fetchRequest()
        request.predicate = nil
        request.sortDescriptors = [NSSortDescriptor(key: "createdDate", ascending: false)]
        
        fetchController = NSFetchedResultsController<Task>(
            fetchRequest: request,
            managedObjectContext: AppDelegate.current.persistentContainer.viewContext,
            sectionNameKeyPath: nil,
            cacheName: nil)
        
        fetchController.delegate = self
        
        taskTableView.dataSource = self
        taskTableView.delegate = self
        taskTableView.register(UINib(nibName: "TaskCellView", bundle: nil), forCellReuseIdentifier: taskCellIdentifier)
        taskTableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        try? fetchController.performFetch()
    }
    
    // MARK: NSFetchedResultsControllerDelegate
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        taskTableView.reloadData()
    }
    

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchController.fetchedObjects?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: taskCellIdentifier, for: indexPath) as! TaskCellView
    
        let cellData = fetchController.object(at: indexPath)
        
        cell.initCell(with: cellData.title ?? "")
        
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {

        case segueAddNewTask:
            if let addTaskController = segue.destination as? AddTaskViewController {
                addTaskController.databaseContext = fetchController.managedObjectContext
            }

        default:
            break
        }
    }
}

