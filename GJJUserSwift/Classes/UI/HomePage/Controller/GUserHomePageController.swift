//
//  GUserHomePageController.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/19.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserHomePageController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var homeTable:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTitleView()
        self.initWithTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initTitleView(){
        let imageView = UIImageView(image: (UIImage(named: "home_img_logo")))
        let width:CGFloat = imageView.width
        let titleView = UIView(frame: CGRectMake(0,0,width,44))
        titleView.backgroundColor = UIColor.clearColor()
        titleView.addSubview(imageView)
        self.navigationItem.titleView = titleView
        imageView.left = 0
        imageView.center = CGPointMake(imageView.center.x, imageView.center.y + 10)
        
    }
    
    func initWithTable(){
     homeTable = UITableView(frame: CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT - 115), style: .Grouped)
     homeTable.delegate = self
     homeTable.dataSource = self
     homeTable.registerNib(UINib(nibName: "GUHomePageCell", bundle:nil), forCellReuseIdentifier: "GUHomePageCell")
     homeTable.showsVerticalScrollIndicator = false
     let header = GUHomePageFooter.homePageFootViewFromXib()
        header.headerClickCallback = { [unowned self] in
            let login = GUserLoginController()
            self.presentViewController(login, animated: true, completion: nil)
        }
     homeTable.tableFooterView = header
     homeTable.tableHeaderView = self.setTableViewHeaderView()
     self.view.addSubview(homeTable)
     self.setRefreshHeader()
    }
    
    func setRefreshHeader(){
        //    homeTable.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "loadData")
        
        //
        //        // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
        //        MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        //        // 设置普通状态的动画图片
        //        [header setImages:idleImages forState:MJRefreshStateIdle];
        //        // 设置即将刷新状态的动画图片（一松开就会刷新的状态）
        //        [header setImages:pullingImages forState:MJRefreshStatePulling];
        //        // 设置正在刷新状态的动画图片
        //        [header setImages:refreshingImages forState:MJRefreshStateRefreshing];
        //        // 设置header
        //        self.tableView.mj_header = header;
        
        let idleImages = ["load_img_down1"]
        let pullingImages = ["load_img_up1",]
        let refreshingImages = ["load_img_loading1"]
        let idle = UIImage.refreshingImages(idleImages)
        let pull = UIImage.refreshingImages(pullingImages)
        let refresh = UIImage.refreshingImages(refreshingImages)
        
        let head = MJRefreshGifHeader(refreshingTarget: self, refreshingAction: "loadData")
        head.setImages(idle as [AnyObject], forState: .Idle)
        head.setImages(pull as [AnyObject], forState: .Pulling)
        head.setImages(refresh as [AnyObject], forState: .Refreshing)
        //
        head.lastUpdatedTimeLabel!.hidden = true;
        head.stateLabel!.hidden = true;
        homeTable.mj_header = head
    }
    
    func loadData(){
      print("刷新")
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
            self.homeTable.mj_header.endRefreshing()
            self.homeTable .reloadData()
        })
    }
    // MARK: -tableviewDelegate
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let homePageCell : GUHomePageCell =  tableView.dequeueReusableCellWithIdentifier("GUHomePageCell", forIndexPath: indexPath) as! GUHomePageCell
        homePageCell.backgroundColor = kBackgroundWhiteColor
        return homePageCell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 84
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 54
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRectMake(0,0,UI_SCREEN_WIDTH,54))
        headerView.backgroundColor = kBackgroundWhiteColor
        
        let top = UIView(frame: CGRectMake(0,0,UI_SCREEN_WIDTH,10))
        top.backgroundColor = kBackgroundGrayColor
        headerView.addSubview(top)
        
        let letfView = UIView(frame: CGRectMake(0,22,4,20))
        letfView.backgroundColor = kCommonColor
        headerView.addSubview(letfView)
        
        let title = UILabel(frame: CGRectMake(15,24,200,16))
        title.text = "样板工地"
        title.textColor = kTitleLabelColor
        title.font = kTitleLabelFont
        headerView.addSubview(title)
        
        return headerView
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 13
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRectMake(0,0,UI_SCREEN_WIDTH,13))
        footerView.backgroundColor = kBackgroundGrayColor
        
        let bottomImage = UIImageView(image: UIImage(named: "home_img_paper1"))
        bottomImage.frame = CGRectMake(0, 10, UI_SCREEN_WIDTH, 3)
        footerView.addSubview(bottomImage)
        
        return footerView
    }
    
    func setTableViewHeaderView() -> UIView{
    
        let headerV = UIView(frame: CGRectMake(0,0,UI_SCREEN_WIDTH,283))
        headerV.backgroundColor = kBackgroundGrayColor
        
        var circleView: GUHomePageScrollView!
        let imageArray: [UIImage!] = [UIImage(named: "home_img_testbanner"), UIImage(named: "2.jpg"), UIImage(named: "3.jpg")]
        circleView = GUHomePageScrollView(frame: CGRectMake(0, 0, UI_SCREEN_WIDTH, 155), imageArray: imageArray)
        circleView.backgroundColor = kBackgroundGrayColor
        headerV.addSubview(circleView)
        
        let homeHeader = GUHomePageHeader.homePageHeaderViewFromXib()
        homeHeader.frame = CGRectMake(0, 155, UI_SCREEN_WIDTH, 128)
        homeHeader.headerClickCallback = { (index:Int, picTilte:String) -> () in
            let alert:UIAlertView!
            alert = UIAlertView(title: picTilte, message: "然后没了", delegate: self, cancelButtonTitle: "取消")
            alert.show()
            
        }
        headerV.addSubview(homeHeader)
      
        return headerV
    }
    
}
