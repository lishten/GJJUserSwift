//
//  GUserConstructFeedBackCell.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/6.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserConstructFeedBackCell: UITableViewCell {

    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.rightImage.image = UIImage(named: "feedback_img_call")
        self.rightImage.clipsToBounds = true
        self.title.textColor = kTitleLabelColor
        self.title.font = kTitleLabelFont
        
        self.leftImage.clipsToBounds = true
        self.subTitle.textColor = kSubTitleLbaelColor
        self.subTitle.font = kDescriptionLabelFont
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
