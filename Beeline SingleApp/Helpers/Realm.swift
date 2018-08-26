//
//  Realm.swift
//  Beeline SingleApp
//
//  Created by Baha Ganyev on 26.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation
import RealmSwift

class DataCoins: Object {
    @objc dynamic var market = ""
    @objc dynamic var volume = ""
    @objc dynamic var supply = ""
}
