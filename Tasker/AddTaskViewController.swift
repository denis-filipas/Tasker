//
//  AddTaskViewController.swift
//  Tasker
//
//  Created by Denis Filipas on 1/19/19.
//  Copyright © 2019 Denis Filipas. All rights reserved.
//

import UIKit
import CoreData

class AddTaskViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    var databaseContext: NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveTask(_ sender: Any) {
        if let context = databaseContext {
            let newTask = Task(context: context)
            newTask.createdDate = Date()
            newTask.title = self.titleTextField.text
            
            try? context.save()
            context.processPendingChanges()
        }
        
        self.dismiss(self)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
