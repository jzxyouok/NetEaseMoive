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

    @IBOutlet weak var logoImage        : UIImageView!
    @IBOutlet weak var titleLabel       : UILabel!
    @IBOutlet weak var gradeLabel       : UILabel!
    @IBOutlet weak var subTitleLabel    : UILabel!
    @IBOutlet weak var screeningLabel   : UILabel!
    @IBOutlet weak var selectSeatBtn    : UIButton!
    @IBOutlet weak var markImageView    : UIImageView!
    @IBOutlet weak var titleImageView   : UIImageView!
    @IBOutlet weak var lineHeight: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configUI()
    }

    
    func configUI() {
        
        lineHeight.constant = 1/UIScreen.mainScreen().scale
    }
    
    
    func configCellForModel(model: SEMoiveModel) {
        titleLabel.text     = model.name
        subTitleLabel.text  = model.highlight
        gradeLabel.text     = model.grade
        screeningLabel.text = model.screening
        
        //配置Logo
        if let imageUrl :String = model.logoUrl {
            logoImage.kf_setImageWithURL(NSURL(string: imageUrl)!, placeholderImage: nil)
        }
        
        //配置电影类型
        if let imageName :String = model.markImageNameForMovieType() {
            markImageView.hidden = false
            markImageView.image = UIImage(named: imageName)
        }else {
            markImageView.hidden = true
        }
        
        //配置标题Mark
        if(model.isNew == "1") {
            titleImageView.hidden = false
            titleImageView.image = UIImage(named: "movieNew")
        } else if (model.isSale == "1") {
            titleImageView.hidden = false
            titleImageView.image = UIImage(named: "movieSale")
        } else {
            titleImageView.hidden = true
        }
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
