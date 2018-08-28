//
//  Realm.swift
//  Beeline SingleApp
//
//  Created by Baha Ganyev on 26.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var name = ""
    @objc dynamic var ID = -1

    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
