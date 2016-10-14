//
//  GUHomePageFooter.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/19.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUHomePageFooter: UIView {

    
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var centerTopImage: UIImageView!
    @IBOutlet weak var centerBottomImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var leftLine: UIView!
    @IBOutlet weak var rightLine: UIView!
    
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var bottomImage: UIImageView!

     var headerClickCallback: (() ->())?
    class func homePageFootViewFromXib() -> GUHomePageFooter {
        let homeFootV = NSBundle.mainBundle().loadNibNamed("GUHomePageFooter", owner: nil, options: nil).last as! GUHomePageFooter
        homeFootV.frame = CGRectMake(0, 0, UIScreen .mainScreen().bounds.width, 234)
        homeFootV.setNormalUI()
        homeFootV.leftImage.sd_setImageWithURL(NSURL(string: "http://pic15.nipic.com/20110623/7126424_034442479144_2.jpg"), placeholderImage: UIImage(named: "blank_img_default_grey"))
        homeFootV.centerTopImage.sd_setImageWithURL(NSURL(string: "http://pic15.nipic.com/20110623/7126424_034442479144_2.jpg"), placeholderImage: UIImage(named: "blank_img_default_grey"))
        homeFootV.centerBottomImage.sd_setImageWithURL(NSURL(string: "http://pic15.nipic.com/20110623/7126424_034442479144_2.jpg"), placeholderImage: UIImage(named: "blank_img_default_grey"))
        homeFootV.rightImage.sd_setImageWithURL(NSURL(string: "http://pic15.nipic.com/20110623/7126424_034442479144_2.jpg"), placeholderImage: UIImage(named: "blank_img_default_grey"))
        
        return homeFootV
    }
    
    func setNormalUI(){
        self.leftLine.backgroundColor = kImageViewWhiteColor
        self.rightLine.backgroundColor = kImageViewWhiteColor
        
        self.bottomLabel.textColor = kSubTitleLbaelColor
        self.bottomLabel.font = kDetailLabelFont
        
        self.loginBtn.setTitleColor(kCommonColor, forState: .Normal)
        self.loginBtn.layer.borderColor = kCommonColor.CGColor
        self.loginBtn.layer.borderWidth = 1
        self.loginBtn.layer.cornerRadius = 10
    
        self.loginBtn.addTarget(self, action: "click", forControlEvents: .TouchUpInside)
        self.bottomImage.backgroundColor = kBackgroundGrayColor
    }
    
    func click(){
    
      headerClickCallback?()
    }
}
