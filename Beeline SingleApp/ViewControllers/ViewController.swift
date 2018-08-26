//
//  ViewController.swift
//  Beeline SingleApp
//
//  Created by Baha Ganyev on 26.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var coinsArray: [Base] = []
    var coinsArrayQuote: [Quote] = []
    var page = 1
    var searchList: [Base] = []
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 80
        searchBar.delegate = self
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
        if searching {
            return searchList.count
        } else {
            return coinsArray.count
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coincell") as! CoinsListCell
        if searching {
            cell.setCoinsData(dataName: searchList[indexPath.row])
        } else {
        cell.setCoinsData(dataName: coinsArray[indexPath.row])
    }
        let lastItem = coinsArray.count - 3
        if indexPath.row == lastItem {
            loadCoins()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let st = UIStoryboard(name: "Main", bundle: nil)
        let vc = st.instantiateViewController(withIdentifier: "CoinDetailViewController") as! CoinDetailViewController
        vc.coinData = coinsArray[indexPath.row]
        self.show(vc, sender: self)
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            searchList = coinsArray
            tableView.reloadData()
            return
        }
        searchList = coinsArray.filter({ (base) -> Bool in
            return base.name.lowercased().contains(searchText.lowercased())
        })
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        self.searchBar.endEditing(true)
        tableView.reloadData()
    }
}

