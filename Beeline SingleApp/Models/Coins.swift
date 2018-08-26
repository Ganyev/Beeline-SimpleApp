//
//  Coins.swift
//  Beeline SingleApp
//
//  Created by Baha Ganyev on 26.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation

struct RawServerResponse : Decodable {
    enum Keys : String, CodingKey {
        case data = "data"
    }
    
    let data : [String:Base]
}

struct Base : Decodable {
    enum CodingKeys : String, CodingKey {
        case id = "id"
        case name = "name"
        case symbol = "symbol"
        case maxSupply = "max_supply"
        case quotes = "quotes"
    }
    
    let id : Int64
    let name : String
    let symbol : String
    let maxSupply : Double?
    let quotes : [String:Quote]
}

struct Quote : Decodable {
    enum CodingKeys : String, CodingKey {
        case price = "price"
        case marketCap = "market_cap"
        case percentChange24h = "percent_change_24h"
    }
    
    let price :  Double
    let marketCap : Double
    let percentChange24h: Double
}
