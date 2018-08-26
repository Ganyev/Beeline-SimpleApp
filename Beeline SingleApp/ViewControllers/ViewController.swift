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
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        ServerManager.shared.getCoins(completion: setCoins, error: showErrorAllert)
    }

    func setCoins(tikers: [String : Base]) {
        coinsArray = tikers.map({$0.value})
        self.tableView.reloadData()
    }
    
    func setCoinsQuote(qoute: [String : Quote]) {
        coinsArrayQuote = qoute.map({$0.value})
        self.tableView.reloadData()
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
        return cell
    }
    
    
}

