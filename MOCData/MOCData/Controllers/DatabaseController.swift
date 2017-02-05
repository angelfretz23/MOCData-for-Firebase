//
//  DatabaseController.swift
//  MOCData
//
//  Created by Angel Contreras on 1/28/17.
//  Copyright © 2017 Angel-Contreras. All rights reserved.
//

import Foundation

let NewDatabaseAdded = Notification.Name(rawValue: "NewDatabaseAdded")

class DatabaseController{
    
    var isGenerateNotifications: Bool = true
    
    var databases: [Database] = []{
        didSet{
            if isGenerateNotifications {
                NotificationCenter.default.post(name: NewDatabaseAdded, object: nil)
            }
        }
    }
    
    func add(database: Database){
        databases.append(database)
    }
    
    
    
}
