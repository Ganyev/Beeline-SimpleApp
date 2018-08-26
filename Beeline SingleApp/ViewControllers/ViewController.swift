//
//  ViewController.swift
//  Beeline SingleApp
//
//  Created by Baha Ganyev on 26.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var coinsArray: [Base] = []
    var coinsArrayQuote: [Quote] = []
    var page = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.rowHeight = 80
        loadCoins()
    }

    func loadCoins() {
        ServerManager.shared.getCoins(start: page, completion: setCoins, error: showErrorAllert)
    }

    
    func setCoins(tikers: [String : Base]) {
        coinsArray.append(contentsOf: tikers.map({$0.value}))
        self.tableView.reloadData()
        page = page + 10
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coinsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coincell") as! CoinsListCell
        cell.setCoinsData(dataName: coinsArray[indexPath.row])
        
        let lastItem = coinsArray.count - 3
        if indexPath.row == lastItem {
            loadCoins()
        }
        
        return cell
    }
    
    
}

