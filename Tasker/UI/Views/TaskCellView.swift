//
//  TaskCellView.swift
//  Tasker
//
//  Created by Denis Filipas on 1/7/19.
//  Copyright © 2019 Denis Filipas. All rights reserved.
//

import UIKit

class TaskCellView: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    public func initCell(with label: String)
    {
        titleLabel.text = label
    }
}
