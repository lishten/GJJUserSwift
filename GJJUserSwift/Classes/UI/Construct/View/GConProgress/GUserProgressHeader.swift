//
//  GUserProgressHeader.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/12/7.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserProgressHeader: UIView {
    
    @IBOutlet weak var circleProgressView: CircleProgressView!
    
    @IBOutlet weak var currentProgress: UILabel!
    
    @IBOutlet weak var allTitle: UILabel!
    class func userProgressHeaderViewFromXib() -> GUserProgressHeader {
        let progressHeaderV = NSBundle.mainBundle().loadNibNamed("GUserProgressHeader", owner: nil, options: nil).last as! GUserProgressHeader
        progressHeaderV.setNormalUI()
        progressHeaderV.backgroundColor = kBackgroundGrayColor
        return progressHeaderV
    }
    func setNormalUI(){
        currentProgress.font = UIFont.systemFontOfSize(45)
        currentProgress.textColor = kCommonColor
        
        allTitle.font = kTitleLabelFont
        allTitle.textColor = kCommonColor
        
        circleProgressView.progress = 0
        
    }
}
