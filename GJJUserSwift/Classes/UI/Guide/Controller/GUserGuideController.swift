//
//  GUserGuideController.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/30.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserGuideController: UIViewController,UIScrollViewDelegate {
  
    var guideScrollView:UIScrollView!
    let imageNameArr1 = ["img_leading_1_960","img_leading_2_960","img_leading_3_960","img_leading_4_960"]
    let imageNameArr2 = ["img_leading_1_1920","img_leading_2_1920","img_leading_3_1920","img_leading_4_1920"]
    var pageCtr: UIPageControl!
    var goTo:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setScrollView()
        self.setGoToBtn()
        self.setImageView()
        self.setPageContro()
    }
    
    func setScrollView(){
       guideScrollView = UIScrollView(frame: CGRectMake(0,0,UI_SCREEN_WIDTH,UI_SCREEN_HEIGHT))
        guideScrollView.delegate = self
        guideScrollView.contentSize = CGSizeMake(4 * UI_SCREEN_WIDTH, 0)
        guideScrollView.contentOffset = CGPointMake(0, 0)
        guideScrollView.pagingEnabled = true
        guideScrollView.showsHorizontalScrollIndicator = false
        guideScrollView.bounces = false
        self.view.addSubview(guideScrollView)
    }
    
    func setImageView(){

        for temp in 0...3{
            let orginX = Int(UI_SCREEN_WIDTH) * temp
          let imageView = UIImageView(frame: CGRectMake(CGFloat(orginX), 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT))
            imageView.userInteractionEnabled = true
            if UI_SCREEN_HEIGHT <= 480 {
               let imageName = self.imageNameArr1[temp]
               imageView.image = UIImage(named: imageName)
            } else {
                let imageName = self.imageNameArr2[temp]
                imageView.image = UIImage(named: imageName)
            }
            if temp == 3{
               imageView.addSubview(self.goTo)
            }
        
            self.guideScrollView.addSubview(imageView)
        }
    }
    
    func setGoToBtn(){
       goTo = UIButton(frame: CGRectMake((UI_SCREEN_WIDTH - 129) / 2,UI_SCREEN_HEIGHT - 72,129,40))
       goTo.setTitle("立即进入", forState: .Normal)
       goTo.setTitleColor(kBackgroundWhiteColor, forState: .Normal)
        goTo.backgroundColor = kCommonColor
        goTo.layer.cornerRadius = 5
        goTo.addTarget(self, action: "goToMain", forControlEvents: .TouchUpInside)
        self.view.addSubview(goTo)
    }
    func setPageContro(){
        pageCtr =  UIPageControl()
        pageCtr.center.x = self.goTo.center.x
        pageCtr.center.y = self.goTo.center.y + 30
        pageCtr.numberOfPages = 4
        pageCtr.currentPage = 0
        pageCtr.pageIndicatorTintColor = kBackgroundGrayColor
        pageCtr.currentPageIndicatorTintColor = kCommonColor
        self.view.addSubview(pageCtr)
    }

    func setCurrentPage() -> Int{
    
        let index:Int = NSInteger(guideScrollView.contentOffset.x / UI_SCREEN_WIDTH)
        return index
    }
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
       self.pageCtr.currentPage = self.setCurrentPage()
//        if self.pageCtr.currentPage + 1 == self.imageNameArr1.count {
//              self.goTo.hidden = false
//        }
    }
    
    func goToMain(){
    
      AppDelegate.enterMainBarController()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
