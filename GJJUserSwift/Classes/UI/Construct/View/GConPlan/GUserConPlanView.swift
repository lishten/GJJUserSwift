//
//  GUserConPlanView.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/9.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserConPlanView: UITableView,UITableViewDataSource,UITableViewDelegate,HeaderViewDidClick{

      var sectionHeader:NSMutableArray!
      var planHeader:GConPlanHeaderView!
      var tableViewHeader:UIView!
      var tableViewFooter:UIView!
      var timeLine:UIView!
    
      override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.registerNib(UINib(nibName: "GConPlanCell", bundle:nil), forCellReuseIdentifier: "GConPlanCell")
        self.separatorStyle = .None
        self.showsVerticalScrollIndicator = false
        
        self.setSectionHeader()
        self.setLineTimeForTableHeaderOrFootView()
    }

      required init?(coder aDecoder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    func setSectionHeader(){
        sectionHeader = NSMutableArray()
        for _ in 1...4{
            planHeader = GConPlanHeaderView()
            planHeader.headerViewDidClickDelegate = self
            sectionHeader.addObject(planHeader)
       }
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        let sHeader = sectionHeader.objectAtIndex(section) as! GConPlanHeaderView
        if sHeader.isOpen {
            
              return 0
        } else {
        
          return 4
        }

    }
  
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        let planCell : GConPlanCell =  tableView.dequeueReusableCellWithIdentifier("GConPlanCell", forIndexPath: indexPath) as! GConPlanCell
            planCell.backView.backgroundColor = kBackgroundWhiteColor
        return planCell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        let sHeader = sectionHeader.objectAtIndex(indexPath.section) as! GConPlanHeaderView
        if sHeader.isOpen {
        
            return 0
        } else {
            
            return 44
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return sectionHeader.objectAtIndex(section) as? UIView
    }
    
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footView = UIView(frame: CGRectMake(0,0,UI_SCREEN_WIDTH,10))
        let leftLine = UIView(frame: CGRectMake(15,0,1,10))
        footView.backgroundColor = kBackgroundGrayColor
        leftLine.backgroundColor = kLineColor
        footView.addSubview(leftLine)
        return footView
    }
 
    func setLineTimeForTableHeaderOrFootView(){
       
        tableViewHeader = UIView(frame: CGRectMake(0, 0, UI_SCREEN_WIDTH, 15))
        let timeLine = UIView(frame: CGRectMake(15,0,1,15))
        tableViewHeader.backgroundColor = kBackgroundGrayColor
        timeLine.backgroundColor = kLineColor
        tableViewHeader.addSubview(timeLine)
        self.tableHeaderView = tableViewHeader
        
        self.timeLine = UIView(frame: CGRectMake(15,-UI_SCREEN_HEIGHT,1,3 * UI_SCREEN_HEIGHT))
        self.timeLine.backgroundColor = kLineColor
        self.insertSubview(self.timeLine, atIndex: 0)
    
    
    }
    
    func returnHeaderView(headerViw: GConPlanHeaderView) {
        if headerViw.isOpen {
            headerViw.expandView.image = UIImage(named: "plan_img_go_pr")
        } else {
            headerViw.expandView.image = UIImage(named: "plan_img_go_un")
        }
        
        self.reloadData()
    }
}
