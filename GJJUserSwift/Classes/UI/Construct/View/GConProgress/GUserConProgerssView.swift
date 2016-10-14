//
//  GUserConProgerssView.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/12/7.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserConProgerssView: UITableView,UITableViewDelegate,UITableViewDataSource {
    var tableHeader:GUserProgressHeader!
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
        self.backgroundColor = kBackgroundGrayColor
        self.registerNib(UINib(nibName: "GUserProgressCell", bundle:nil), forCellReuseIdentifier: "GUserProgressCell")
        self.separatorStyle = .None
        self.setTabelViewHeader()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let progressCell : GUserProgressCell =  tableView.dequeueReusableCellWithIdentifier("GUserProgressCell", forIndexPath: indexPath) as! GUserProgressCell
        return progressCell
    }
    func  tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    func  setTabelViewHeader(){
        let headBk = UIView()
        var spacing:CGFloat!
        if UI_SCREEN_HEIGHT == 480 {
            spacing = 30
        } else if UI_SCREEN_HEIGHT > 480 {
            spacing = 50
        }
        headBk.frame = CGRectMake(0, 0, UI_SCREEN_WIDTH, 200 + spacing * 2)
        tableHeader = GUserProgressHeader.userProgressHeaderViewFromXib()
        tableHeader.frame = CGRectMake(0, spacing, UI_SCREEN_WIDTH, 200)
        headBk.addSubview(tableHeader)
        
        let  bottomLine = UIImageView()
        bottomLine.image = UIImage(named: "progress_img_line")
        bottomLine.frame = CGRectMake(30, headBk.frame.size.height - 2, UI_SCREEN_WIDTH - 60, 2)
        headBk.addSubview(bottomLine)
        self.tableHeaderView = headBk
    }
}
