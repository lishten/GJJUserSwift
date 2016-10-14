//
//  GFeedTypeOneCell.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/20.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GFeedTypeOneCell: UITableViewCell {

    
    @IBOutlet weak var bkView: UIView!
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var subTitle: UILabel!
    
    @IBOutlet weak var mainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = kBackgroundGrayColor
        self.selectionStyle = .None
        self.frame = CGRectMake(0, 0, UI_SCREEN_WIDTH, 141)
        self.setNormalUI()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setNormalUI(){
      
        bkView.backgroundColor = kBackgroundWhiteColor
        bkView.layer.borderWidth = 0.5
        bkView.layer.borderColor = kLineColor.CGColor
        bkView.layer.cornerRadius = 5
        
        title.font = kTitleLabelFont
        title.textColor = kTitleLabelColor
        
        subTitle.font = kDescriptionLabelFont
        subTitle.textColor = kSubTitleLbaelColor
      
        mainImage.image = UIImage(named: "home_img_testbanner")
    
    }
}
