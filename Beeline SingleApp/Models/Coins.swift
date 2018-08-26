//
//  Coins.swift
//  Beeline SingleApp
//
//  Created by Baha Ganyev on 26.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import Foundation

class Coin: Decodable {
    var data: [CoinResult] = []
}

class CoinResult: Decodable {
    var id: Int?
    var name: String?
    var symbol: String?
    var quotes: [QuotesResult] = []
}

class QuotesResult: Decodable {
    var USD: [USDResult] = []
}

class USDResult: Decodable {
    var price: Double?
    var percent_change_24h: Double?
}
