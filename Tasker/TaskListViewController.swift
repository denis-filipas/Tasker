//
//  ViewController.swift
//  Tasker
//
//  Created by Denis Filipas on 1/7/19.
//  Copyright © 2019 Denis Filipas. All rights reserved.
//

import UIKit

private let taskCellIdentifier = "TaskCellID"

class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var tableData = ["text1","text2","text3"]
    
    @IBOutlet weak var taskTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskTableView.delegate = self
        taskTableView.dataSource = self
        taskTableView.register(UINib(nibName: "TaskCellView", bundle: nil), forCellReuseIdentifier: taskCellIdentifier)
        
    }

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: taskCellIdentifier, for: indexPath) as! TaskCellView
    
        cell.initCell(with: tableData[indexPath.row])
        
        return cell
    }
}

