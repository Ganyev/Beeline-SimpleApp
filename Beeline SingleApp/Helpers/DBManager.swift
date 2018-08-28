//
//  DBManager.swift
//  Beeline SingleApp
//
//  Created by Baha Ganyev on 28.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class DBManager {
    
    private var database:Realm
    static let sharedInstance = DBManager()
    
    private init() {
        
        database = try! Realm()
        
    }
    
    func getDataFromDB() -> Results<Item> {
        
        let results: Results<Item> = database.objects(Item.self)
        return results
    }
    
    func addData(object: Item) {
        
        try! database.write {
            database.add(object, update: true)
            print("Added new object")
        }
    }
    
    func deleteAllDatabase()  {
        try! database.write {
            database.deleteAll()
        }
    }
    
    func deleteFromDb(object: Item) {
        
        try! database.write {
            
            database.delete(object)
        }
    }
    
}
