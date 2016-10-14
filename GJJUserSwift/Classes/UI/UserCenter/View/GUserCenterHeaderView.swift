//
//  GUserCenterHeaderView.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/5.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserCenterHeaderView: UIView {
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var userId: UILabel!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var topView: UIView!
    
    class func userCenterHeaderViewFromXib() -> GUserCenterHeaderView {
        let centetHeaderV = NSBundle.mainBundle().loadNibNamed("GUserCenterHeaderView", owner: nil, options: nil).last as! GUserCenterHeaderView
        centetHeaderV.frame = CGRectMake(0, 0, UIScreen .mainScreen().bounds.width, 95)
        
        centetHeaderV.topView.backgroundColor = kBackgroundGrayColor
        
        centetHeaderV.userId.text = "Guojj"
        centetHeaderV.userId.textColor = kSubTitleLbaelColor
        centetHeaderV.userId.font = kDetailLabelFont
        
        centetHeaderV.userName.font = kTitleLabelFont
        centetHeaderV.userName.textColor = kTitleLabelColor
        centetHeaderV.userName.text = "Swift"
    
        centetHeaderV.userIcon.layer.cornerRadius = 27.5
        centetHeaderV.userIcon.clipsToBounds = true
        let url = NSURL(string:"http://www.huabian.com/uploadfile/2015/1028/20151028023436352.jpg")
        centetHeaderV.userIcon.sd_setImageWithURL(url, placeholderImage: UIImage(named: "personal_img_head_default"))
        return centetHeaderV
    }

}
