//
//  Database.swift
//  MOCData
//
//  Created by Angel Contreras on 1/28/17.
//  Copyright © 2017 Angel-Contreras. All rights reserved.
//

import Foundation

class Database: Equatable{
    var name: String
    var baseURL: String?
    var dateUpdated: Date
    
    init(name: String, baseURL: String? = nil){
        self.name = name
        self.baseURL = baseURL
        dateUpdated = Date()
    }
}

func ==(left: Database, right: Database) -> Bool{
    return left.baseURL == right.baseURL
}
