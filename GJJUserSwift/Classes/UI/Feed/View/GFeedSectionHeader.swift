//
//  GFeedSectionHeader.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/20.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GFeedSectionHeader: UIView {

    @IBOutlet weak var timeLine: UIView!
   
    @IBOutlet weak var timeLabel: UILabel!
    
    class func feedSectionHeaderFromXib() -> GFeedSectionHeader {
        let sectionHeaderV = NSBundle.mainBundle().loadNibNamed("GFeedSectionHeader", owner: nil, options: nil).last as! GFeedSectionHeader
        sectionHeaderV.frame = CGRectMake(0, 0, UI_SCREEN_WIDTH, 30)
        sectionHeaderV.setNormalUI()
        return sectionHeaderV
    }
    
    func setNormalUI(){
      self.timeLine.backgroundColor = UIColor.UIColorFromRGB(0x909095)
      self.timeLabel.font = kDescriptionLabelFont
      self.timeLabel.textColor = kTitleLabelColor
      self.backgroundColor = kBackgroundGrayColor
 }
}
