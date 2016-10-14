//
//  GUserRefreshNorMalHeader.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/12/2.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserRefreshNorMalHeader: MJRefreshHeader {

    var title:UILabel!
    var arrow:UIImageView!
    var loading:UIActivityIndicatorView!
    
    override func prepare() {
        super.prepare()
        
        self.mj_h = 50
        
        title = UILabel()
        title.textColor = UIColor.UIColorFromRGB(0xa0a0a6)
        title.font = UIFont.systemFontOfSize(13)
        self.addSubview(title)
        
        let tempArrow = UIImageView(image: UIImage(named: "load_img_down"))
        tempArrow.contentMode = .ScaleAspectFit
        self.addSubview(tempArrow)
        self.arrow = tempArrow
        
        let loading = UIActivityIndicatorView(activityIndicatorStyle: .Gray)
        self.addSubview(loading)
        self.loading = loading
    }

    
    override func placeSubviews() {
        super.placeSubviews()
        self.title.frame = CGRectMake(145, 23.5, 100, 13)
        self.arrow.frame = CGRectMake(124, 22, 16, 16)
        self.loading.frame = CGRectMake(122, 20, 20, 20)
    }
    
    override func scrollViewContentOffsetDidChange(change: [NSObject : AnyObject]!) {
        super.scrollViewContentOffsetDidChange(change)
         self.state(self.state)
    }
    
    override func scrollViewContentSizeDidChange(change: [NSObject : AnyObject]!) {
        super.scrollViewContentSizeDidChange(change)
    }
    
    override func scrollViewPanStateDidChange(change: [NSObject : AnyObject]!) {
        super.scrollViewPanStateDidChange(change)
    }
    
    func  state(state:MJRefreshState){
        
        self.arrow.hidden = false
        self.loading.stopAnimating()
        switch state {
        case .Idle:
//            self.title.text = "下拉刷新"
//            UIView.animateWithDuration(0.35,
//                delay: 0.0,
//                options: .CurveEaseInOut ,
//                animations: {
//                    self.arrow.transform = CGAffineTransformMakeRotation(CGFloat(0))
//               },
//                completion:nil)
            
            UIView.animateWithDuration(0.35,
                delay: 0.0,
                options: .CurveEaseInOut,
                animations: { () -> Void in
                    self.arrow.transform = CGAffineTransformMakeRotation(CGFloat(0))

                }, completion: { (Bool) -> Void in
                    self.title.text = "下拉刷新"
            })
            break;
        case .Pulling:
//            self.title.text = "松开刷新"
//            UIView.animateWithDuration(0.35,
//                delay: 0.0,
//                options: .CurveEaseInOut ,
//                animations: {
//                    self.arrow.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
//                },
//                completion:nil)
            
            UIView.animateWithDuration(0.35,
                delay: 0.0,
                options: .CurveEaseInOut,
                animations: { () -> Void in
                    self.arrow.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
                }, completion: { (Bool) -> Void in
                    self.title.text = "松开刷新"
            })
            break;
        case .Refreshing:
            self.arrow.hidden = true
            self.loading.startAnimating()
            self.title.text = "正在刷新"
            break;
        default:
            break;
        
        }
    
    
    }
   
}
