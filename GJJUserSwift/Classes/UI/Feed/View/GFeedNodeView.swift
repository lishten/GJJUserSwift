//
//  GFeedNodeView.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/20.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GFeedNodeView: UIView {
    
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var stateLabelOne: UILabel!
    @IBOutlet weak var stateLabelTwo: UILabel!
    @IBOutlet weak var stateLabelThree: UILabel!
    @IBOutlet weak var stateLabelFour: UILabel!
    @IBOutlet weak var stateLabelFive: UILabel!
    
    @IBOutlet weak var nodeLabelOne: UILabel!
    @IBOutlet weak var nodeLabelTwo: UILabel!
    @IBOutlet weak var nodeLabelThree: UILabel!
    @IBOutlet weak var nodeLabelFour: UILabel!
    @IBOutlet weak var nodeLabelFive: UILabel!
    
    @IBOutlet weak var stateImageOne: UIImageView!
    @IBOutlet weak var stateImageTwo: UIImageView!
    @IBOutlet weak var stateImageThree: UIImageView!
    @IBOutlet weak var stateImageFour: UIImageView!
    @IBOutlet weak var stateImageFive: UIImageView!


    
    class func userFeedHeaderViewFromXib() -> GFeedNodeView {
        let feedHeaderV = NSBundle.mainBundle().loadNibNamed("GFeedNodeView", owner: nil, options: nil).last as! GFeedNodeView
        feedHeaderV.setNormalUI()
        return feedHeaderV
    }
    
    func setNormalUI(){
        
        self.progressView.progressTintColor = kCommonColor
        self.progressView.trackTintColor = UIColor.UIColorFromRGB(0xdcdce2)
        
        self.layer.borderColor = kLineColor.CGColor
        self.layer.borderWidth = 0.5
    
        var setLabelNormal:((label:UILabel) -> ())
    
        setLabelNormal = { (label:UILabel) -> () in
            label.font = kDescriptionLabelFont
            label.textColor = kSubTitleLbaelColor
        }
        
        setLabelNormal(label: self.stateLabelOne)
        setLabelNormal(label: self.stateLabelTwo)
        setLabelNormal(label: self.stateLabelThree)
        setLabelNormal(label: self.stateLabelFour)
        setLabelNormal(label: self.stateLabelFive)
        
        setLabelNormal(label: self.nodeLabelOne)
        setLabelNormal(label: self.nodeLabelTwo)
        setLabelNormal(label: self.nodeLabelThree)
        setLabelNormal(label: self.nodeLabelFour)
        setLabelNormal(label: self.nodeLabelFive)
        
    }
}
