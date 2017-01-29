//
//  Node.swift
//  MOCData
//
//  Created by Angel Contreras on 1/28/17.
//  Copyright © 2017 Angel-Contreras. All rights reserved.
//

import Foundation

struct Node<T: Comparable>{
    var key: String
    var value: T?
    
    init(key: String, value: T?){
        self.key = key
        self.value = value
    }
    
    init?(dictionary: [String: T?]){
        guard let key = dictionary.first?.key,
            let value = dictionary.first?.value else { return nil }
        
        self.key = key
        self.value = value
    }
    
    var jsonData: Data?{
        return (try? JSONSerialization.data(withJSONObject: [self.key: self.value], options: .prettyPrinted))
    }
}
