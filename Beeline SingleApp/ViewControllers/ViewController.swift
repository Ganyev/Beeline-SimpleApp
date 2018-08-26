//
//  ViewController.swift
//  Beeline SingleApp
//
//  Created by Baha Ganyev on 26.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var coinsArray: RawServerResponse?
    override func viewDidLoad() {
        super.viewDidLoad()
        ServerManager.shared.getCoins(completion: setCoins, error: showErrorAllert)
        
    }

    func setCoins(coin: RawServerResponse) {
        coinsArray = coin
        self.tableView.reloadData()
    }
    
}

