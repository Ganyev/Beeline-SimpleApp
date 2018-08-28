//
//  CoinDetailViewController.swift
//  Beeline SingleApp
//
//  Created by Baha Ganyev on 26.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit
import RealmSwift

class CoinDetailViewController: UIViewController {

    @IBOutlet weak var market: UILabel!
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var supply: UILabel!
    let realm = try! Realm()
    var currentItem:Item?
    var coinData: Base?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let marketCap = coinData?.quotes.values.first?.marketCap else {
            market.text = "n/a"
            return
        }
        guard let volume24 = coinData?.quotes.values.first?.percentChange24h else {
            volume.text = "n/a"
            return
        }
        guard let cSupply = coinData?.circulatingSupply else {
            supply.text = "n/a"
            return
        }
        market.text = String(marketCap)
        volume.text = String(volume24)
        supply.text = String(cSupply)
    }

    @IBAction func addFavorites() {
        let item = Item()
        
        if(currentItem == nil) {
            item.ID = DBManager.sharedInstance.getDataFromDB().count
        }
        
        item.name = (coinData?.name)!
        DBManager.sharedInstance.addData(object: item)
        self.dismiss(animated: true) { }
        
        let alert = UIAlertController(title: "Success!", message: "Added to Favorites", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .destructive, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }

}
