//
//  GConPlanCell.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/9.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GConPlanCell: UITableViewCell {

    @IBOutlet weak var backView: UIImageView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var signView: UIImageView!
    @IBOutlet weak var projectName: UILabel!
    @IBOutlet weak var projectTime: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        self.backgroundColor = kBackgroundGrayColor
        self.selectionStyle = .None
        lineView.backgroundColor = kLineColor
        
        projectName.font = kTitleLabelFont
        projectName.textColor = kTitleLabelColor
        projectName.userInteractionEnabled = false
        
        projectTime.font = kDetailLabelFont
        projectTime.textColor = kSubTitleLbaelColor
        projectTime.userInteractionEnabled = false
        
        self.contentView.backgroundColor = UIColor.clearColor()
        // Initialization code
    }
    
    func  setCellBackViewImage(index:NSIndexPath){
        if index.row == 3 {
          backView.image = self.uiImageName("plan_img_list3_un")
          backView.highlightedImage = self.uiImageName("plan_img_list3_pr")
        } else {
          backView.image = self.uiImageName("plan_img_list3_un")
          backView.highlightedImage = self.uiImageName("plan_img_list3_pr")
        }
 
    }
    
    func uiImageName(imageName:String) -> UIImage {
//            let top:CGFloat = 10
//            let bottom:CGFloat = 10
//            let left:CGFloat = 5
//            let right:CGFloat = 10
            let insets:UIEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0)
            let image:UIImage = UIImage(named: imageName)!
            image.resizableImageWithCapInsets(insets, resizingMode: UIImageResizingMode.Stretch)
            return image
        }
    
   override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
