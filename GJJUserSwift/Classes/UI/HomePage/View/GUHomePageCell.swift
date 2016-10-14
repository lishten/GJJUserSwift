//
//  GUHomePageCell.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/19.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUHomePageCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var houseType: UILabel!
    @IBOutlet weak var local: UILabel!
    @IBOutlet weak var localBk: UIView!
    
    @IBOutlet weak var showImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setNomalUI()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setNomalUI(){
        title.textColor = kTitleLabelColor
        title.font = kTitleLabelFont

        subtitle.textColor = kSubTitleLbaelColor
        subtitle.font = kDetailLabelFont

        houseType.textColor = kTitleLabelColor
        houseType.font = kDetailLabelFont

        local.textColor = kCommonColor
        local.font = kDescriptionLabelFont
        
        localBk.layer.borderWidth = 0.5
        localBk.layer.borderColor = kCommonColor.CGColor
        localBk.layer.cornerRadius = 3
        
        showImage.sd_setImageWithURL(NSURL(string: "http://pic15.nipic.com/20110623/7126424_034442479144_2.jpg"), placeholderImage: UIImage(named: "blank_img_default_grey"))
    }
}
