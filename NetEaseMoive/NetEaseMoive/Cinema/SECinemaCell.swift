//
//  SECinemaCell.swift
//  NetEaseMoive
//
//  Created by 李永方 on 15/11/29.
//  Copyright © 2015年 swiftMe. All rights reserved.
//

import UIKit

class SECinemaCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!

    @IBOutlet weak var adressLabel: UILabel!
    
    @IBOutlet weak var screenLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var seatLabel: UILabel!
  
    @IBOutlet weak var ticketLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
