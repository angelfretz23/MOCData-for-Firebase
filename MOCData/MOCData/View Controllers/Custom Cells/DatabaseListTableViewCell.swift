//
//  DatabaseListTableViewCell.swift
//  MOCData
//
//  Created by Angel Contreras on 1/28/17.
//  Copyright © 2017 Angel-Contreras. All rights reserved.
//

import UIKit

class DatabaseListTableViewCell: UITableViewCell{
    @IBOutlet weak var databaseName: UILabel!
    
    func updateCellWith(database: Database){
        databaseName.text = database.name
    }
}
