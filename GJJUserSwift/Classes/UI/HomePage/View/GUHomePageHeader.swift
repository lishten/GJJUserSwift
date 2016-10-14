//
//  GUHomePageHeader.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/19.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUHomePageHeader: UIView {

    @IBOutlet weak var btnOne: UIButton!
    @IBOutlet weak var btnTwo: UIButton!
    @IBOutlet weak var btnThree: UIButton!
    @IBOutlet weak var btnFour: UIButton!
    
    var headerClickCallback: ((index:Int, title:String) ->())? //头部点击后的回调
    class func homePageHeaderViewFromXib() -> GUHomePageHeader {
         let homeHeaderV = NSBundle.mainBundle().loadNibNamed("GUHomePageHeader", owner: nil, options: nil).last as! GUHomePageHeader
        homeHeaderV.setNormalUI()
        
        return homeHeaderV
    }

    func setNormalUI(){
    
        self.btnOne.addTarget(self, action: "click:", forControlEvents: .TouchUpInside)
        self.btnTwo.addTarget(self, action: "click:", forControlEvents: .TouchUpInside)
        self.btnThree.addTarget(self, action: "click:", forControlEvents: .TouchUpInside)
        self.btnFour.addTarget(self, action: "click:", forControlEvents: .TouchUpInside)
    
    }
    func click(btn:UIButton){
      print("\(btn.tag)")
        var title = ""
        switch btn.tag{
        case 101:
            title = "效果图"
            break
        case 102:
            title = "敬请期待"
            break
        case 103:
            title = "装修攻略"
            break
        case 104:
            title = "装修问答"
            break
        default:
        break
        }
        headerClickCallback?(index: btn.tag, title:title)
    }
}
