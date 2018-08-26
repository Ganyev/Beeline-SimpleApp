//
//  CoinsListCell.swift
//  Beeline SingleApp
//
//  Created by Baha Ganyev on 26.08.2018.
//  Copyright © 2018 Baha Ganyev. All rights reserved.
//

import UIKit

class CoinsListCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLable: UILabel!
    @IBOutlet weak var hourLable: UILabel!
    
    func setCoinsData(dataName: Base) {
        nameLabel.text = dataName.name
        guard let quote = dataName.quotes.values.first else {
            priceLable.text = "n/a"
            hourLable.text = "n/a"
            return
        }
        priceLable.text = String(quote.price)
        hourLable.text = String(quote.percentChange24h)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
