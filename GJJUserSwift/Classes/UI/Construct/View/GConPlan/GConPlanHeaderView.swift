//
//  GConPlanHeaderView.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/9.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

typealias sendValueClosure = (headerView:GConPlanHeaderView) -> Void

//协议
protocol HeaderViewDidClick{
    //协议中得方法不能有结构体
    func returnHeaderView(headerViw: GConPlanHeaderView)
}

class GConPlanHeaderView: UIView {

    var showBtn:UIButton!
    var titleName:UILabel!
    var titleTime:UILabel!
    var timeLine:UIView!
    var stateView:UIImageView!
    var expandView:UIImageView!
    var isOpen:Bool = true
    var headerViewDidClickDelegate: HeaderViewDidClick?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        showBtn = UIButton(type: .Custom)
        
        showBtn.contentHorizontalAlignment = .Left
        showBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0)
        showBtn.adjustsImageWhenHighlighted = true
        
        showBtn.tintColor = kCellSelectedColor
        showBtn.backgroundColor = kBackgroundWhiteColor
        showBtn.imageView?.clipsToBounds = true
        showBtn.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
        self.addSubview(showBtn)
        
        // MARK: -初始化titleNmae
        titleName = UILabel()
        titleName.text = "水电阶段"
        titleName.backgroundColor = UIColor.clearColor()
        titleName.textAlignment = .Center
        titleName.textColor = kTitleLabelColor
        titleName.font = kTitleLabelFont
        self .addSubview(titleName)
        
        // MARK: -初始化titleTime
        titleTime = UILabel()
        titleTime.text = "6.19-至今"
        titleTime.backgroundColor = UIColor.clearColor()
        titleTime.textAlignment = .Right
        titleTime.textColor = kSubTitleLbaelColor
        titleTime.font = kDetailLabelFont
        self.addSubview(titleTime)

        // MARK: -初始化左边竖线
        timeLine = UIView(frame:CGRectMake(15, 0, 1, 50))
        timeLine.backgroundColor = kLineColor
        self.addSubview(timeLine)
        
        // MARK: -初始化工程当前状态View
        stateView = UIImageView(frame: CGRectMake(9, 18, 13, 13))
        stateView.backgroundColor = kBackgroundGrayColor
        stateView.image = UIImage(named: "plan_img_circle2")
        self.addSubview(stateView)
        
        // MARK: -初始化箭头View
        expandView = UIImageView()
        expandView.image = UIImage(named: "plan_img_go_pr")
        self.addSubview(expandView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        // MARK: -设置图片
        /*
        let insets:UIEdgeInsets = UIEdgeInsetsMake(19, 19, 8, 5)
        let prImage:UIImage = UIImage(named: "plan_img_list2_un")!
        prImage.resizableImageWithCapInsets(insets, resizingMode: UIImageResizingMode.Stretch)
        let unImage:UIImage = UIImage(named: "plan_img_list2_un")!
        unImage.resizableImageWithCapInsets(insets, resizingMode: UIImageResizingMode.Stretch)
        showBtn.setBackgroundImage(prImage, forState: .Normal)
        
        let prImage4 = UIImage(named: "plan_img_list1_pr")!
        prImage4.resizableImageWithCapInsets(insets, resizingMode: UIImageResizingMode.Stretch)
        showBtn.setBackgroundImage(prImage, forState: .Selected)
        */
        showBtn.imageView?.backgroundColor = kBackgroundWhiteColor
        self.backgroundColor = UIColor.clearColor()
        
        var frame:CGRect = self.bounds
        let x:CGFloat = UI_SCREEN_WIDTH - 30
        frame.origin.x = self.bounds.size.width - x
        frame.size.width = self.bounds.size.width - 40
        showBtn.frame = frame
        
        titleName.frame = CGRectMake(45, 0, 100, 50)
        
        let countY:CGFloat = 0
        let countH:CGFloat = self.frame.size.height
        let countW:CGFloat = 150
        let countX:CGFloat = self.frame.size.width  - 40 - countW
        titleTime.frame = CGRectMake(countX, countY, countW, countH)
        
        expandView.frame = CGRectMake(self.frame.size.width - 37, 20, 12, 12)
        
    }
    
    func btnClick(Btn:UIButton){
        self.isOpen = !self.isOpen
        self.headerViewDidClickDelegate?.returnHeaderView(self)
    }
}
