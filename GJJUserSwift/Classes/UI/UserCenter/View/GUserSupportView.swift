//
//  GUserSupportView.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/6.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserSupportView: UIView {
    
    @IBOutlet weak var fiveYear: UILabel!
    @IBOutlet weak var threeYear: UILabel!
    @IBOutlet weak var allLife: UILabel!
    @IBOutlet weak var sdLabel: UILabel!
    @IBOutlet weak var qwLabel: UILabel!
    @IBOutlet weak var fzLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var detailLabel: UILabel!
    
    @IBOutlet weak var imageTop: UIImageView!
    class func userSupportView() -> GUserSupportView {
        let userSupportView = NSBundle.mainBundle().loadNibNamed("GUserSupportView", owner: nil, options: nil).last as! GUserSupportView
                
                userSupportView.frame = CGRectMake(15, 20, UI_SCREEN_WIDTH - 30, 365)
                userSupportView.fiveYear.font = UIFont.systemFontOfSize(24)
                userSupportView.threeYear.font = UIFont.systemFontOfSize(24)
                userSupportView.allLife.font = UIFont.systemFontOfSize(24)

                userSupportView.fiveYear.textColor = UIColor.UIColorFromRGB(0x35c868)
                userSupportView.threeYear.textColor = UIColor.UIColorFromRGB(0x35c868)
                userSupportView.allLife.textColor = UIColor.UIColorFromRGB(0x35c868)

                userSupportView.sdLabel.font = kDescriptionLabelFont
                userSupportView.qwLabel.font = kDescriptionLabelFont
                userSupportView.fzLabel.font = kDescriptionLabelFont

                userSupportView.sdLabel.textColor = kTitleLabelColor
                userSupportView.qwLabel.textColor = kTitleLabelColor
                userSupportView.fzLabel.textColor = kTitleLabelColor

                userSupportView.detailLabel.font = kDetailLabelFont
                userSupportView.detailLabel.textColor = kSubTitleLbaelColor

                userSupportView.lineView.backgroundColor = kLineColor
        
                userSupportView.backgroundColor = kBackgroundWhiteColor
        
                userSupportView.layer.borderColor = kLineColor.CGColor
                userSupportView.layer.borderWidth = 1
                userSupportView.layer.cornerRadius = 5
        return userSupportView
    }

}
