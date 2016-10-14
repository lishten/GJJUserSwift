//
//  GUserBaseNavController.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/6.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserBaseNavController: UINavigationController,UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

      self.delegate = self
      self.navigationBar.translucent = false
      self.navigationBar.barTintColor = kCommonColor
      self.edgesForExtendedLayout = UIRectEdge.None
      self.navigationBar.barStyle = UIBarStyle.Default
      self.navigationBar.tintColor = UIColor.whiteColor()
    
        //移除导航栏底部1像素阴影
      self.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
      self.navigationBar.shadowImage = UIImage()
        //修改title颜色
//        UINavigationBar.appearance().titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(17.0), NSForegroundColorAttributeName: kBackgroundWhiteColor]
     self.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont.systemFontOfSize(18.0), NSForegroundColorAttributeName: kBackgroundWhiteColor]
        
   self.interactivePopGestureRecognizer!.delegate = nil;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    lazy var backBtn: UIButton = {
        //设置返回按钮属性
        let backBtn = UIButton(type: UIButtonType.Custom)
        backBtn.titleLabel?.font = UIFont.systemFontOfSize(17)
        backBtn.setTitleColor(kBackgroundWhiteColor, forState: .Normal)
        backBtn.setImage(UIImage(named: "all_icon_back_un"), forState: .Normal)
        backBtn.addTarget(self, action: "backBtnClick", forControlEvents: .TouchUpInside)
        backBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.Left
        backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
        backBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0)
        let btnW: CGFloat = UI_SCREEN_WIDTH > 375.0 ? 60 : 44
        backBtn.frame = CGRectMake(0, 0, btnW, 40)
        return backBtn
    }()
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        if self.childViewControllers.count > 0 {
            if self.childViewControllers.count == 1 || self.childViewControllers.count > 1 {
                backBtn.setTitle("返回", forState: .Normal)
            }

        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backBtn)
            
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    func backBtnClick() {
        self.popViewControllerAnimated(true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
