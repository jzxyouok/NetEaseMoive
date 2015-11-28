//
//  SEMovieTableViewCell.swift
//  NetEaseMoive
//
//  Created by ftxbird on 15/11/29.
//  Copyright © 2015年 swiftMe. All rights reserved.
//

import UIKit
import Kingfisher

class SEMovieTableViewCell: UITableViewCell {

    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var gradeLabel: UILabel!
    
    
    @IBOutlet weak var subTitleLabel: UILabel!
    
    @IBOutlet weak var screeningLabel: UILabel!
    
    
    @IBOutlet weak var selectSeatBtn: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCellForModel(model: SEMoiveModel) {
    
        
        titleLabel.text     = model.name
        subTitleLabel.text  = model.highlight
        gradeLabel.text     = model.grade
        screeningLabel.text = model.screening
        
        if (model.logoUrl != nil) {
            logoImage.kf_setImageWithURL(NSURL(string: model.logoUrl!)!, placeholderImage: nil)
        }
    }
    
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
