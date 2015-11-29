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
    
    var SECinemalM: SECinemaModel? {
        
        didSet {
        
            nameLabel.text = SECinemalM?.name
            adressLabel.text = SECinemalM?.address
            screenLabel.text = SECinemalM?.screenings
            priceLabel.text = (SECinemalM?.lowPrice)!
            
            //判断是否有座
            if (SECinemalM?.isSeatSupport == "0" && SECinemalM?.isCouponSupport == "0"){
                
                seatLabel.hidden = true
                ticketLabel.hidden = true
        
            }else if (SECinemalM?.isSeatSupport == "0" && SECinemalM?.isCouponSupport == "1"){
            
                seatLabel.hidden = true
                ticketLabel.hidden = false
                ticketLabel.text = "券"
            
            }else if (SECinemalM?.isSeatSupport == "1" && SECinemalM?.isCouponSupport == "0") {
            
                seatLabel.hidden = true
                ticketLabel.hidden = false
                ticketLabel.text = "座"
            }else {
            
                seatLabel.hidden = false
                ticketLabel.hidden = false
                seatLabel.text = "座"
                ticketLabel.text = "券"
            
            }
        
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
