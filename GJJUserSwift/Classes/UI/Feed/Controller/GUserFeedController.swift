//
//  GUserFeedController.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/5.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserFeedController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    var feedTable:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "最新动态"
        self.setFeedTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    func setFeedTable(){
     feedTable = UITableView(frame: self.view.frame, style: .Grouped)
     feedTable.delegate = self
     feedTable.dataSource = self
     feedTable.scrollsToTop = true
     feedTable.backgroundColor = kBackgroundGrayColor
     feedTable.separatorStyle = .None
     feedTable!.registerNib(UINib(nibName: "GFeedTypeOneCell", bundle:nil), forCellReuseIdentifier: "GFeedTypeOneCell")
     feedTable.tableHeaderView = self.setTabelHeaderView()
        
    let timeLine = UIView(frame: CGRectMake(25,0,1,2 * UI_SCREEN_HEIGHT))
        timeLine.backgroundColor = UIColor.UIColorFromRGB(0x909095)
    feedTable.insertSubview(timeLine, atIndex: 0)
     self.view.addSubview(feedTable)
        
       
        
    //设置下拉刷新
       let header =  GUserRefreshNorMalHeader(refreshingTarget: self, refreshingAction: "loadData")
       feedTable.mj_header = header
    }
    
    func loadData(){
        print("刷新")
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
            self.feedTable.mj_header.endRefreshing()
            self.feedTable .reloadData()
        })
    
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 141
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let feedCell : GFeedTypeOneCell =  tableView.dequeueReusableCellWithIdentifier("GFeedTypeOneCell", forIndexPath: indexPath) as! GFeedTypeOneCell
   
        return feedCell
    }
   
    func  tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeader = GFeedSectionHeader.feedSectionHeaderFromXib()
        return sectionHeader
    }
    
    func setTabelHeaderView() -> UIView {
        
        let feedNodeView = GFeedNodeView.userFeedHeaderViewFromXib()
        let conScrollView:UIScrollView!
        conScrollView = UIScrollView(frame: CGRectMake(0, 40, UI_SCREEN_WIDTH, 70))
        conScrollView.delegate = self
        conScrollView.contentOffset = CGPointMake(0, 0)
        conScrollView.pagingEnabled = true
        conScrollView.showsHorizontalScrollIndicator = false
        conScrollView.bounces = false
     
        if feedNodeView.frame.size.width > UI_SCREEN_WIDTH {
          let sizeW = UI_SCREEN_WIDTH + (feedNodeView.frame.size.width - UI_SCREEN_WIDTH)
            conScrollView.contentSize = CGSizeMake(sizeW, 0)
        } else {
            conScrollView.contentSize = CGSizeMake(UI_SCREEN_WIDTH, 0)
        }
       
       conScrollView.addSubview(feedNodeView)
        
       return conScrollView
    }
}
