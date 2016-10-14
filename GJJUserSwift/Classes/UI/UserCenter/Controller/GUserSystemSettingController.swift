//
//  GUserSystemSettingController.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/6.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserSystemSettingController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var systemTbale:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "系统设置"
        self.setSystemTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setSystemTable(){
        systemTbale = UITableView(frame: CGRectMake(0, 0, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT), style: .Grouped)
        systemTbale.delegate = self
        systemTbale.dataSource = self
//        systemTbale!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "GUserSysytemrCell")
        systemTbale!.registerNib(UINib(nibName: "GUserSystemLogOutCell", bundle:nil), forCellReuseIdentifier: "GUserSystemLogOutCell")
        self.view.addSubview(systemTbale)
    
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section == 0{
           return 2
        } else {
           return 1
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        //系统cell使用
//            var cell = tableView .dequeueReusableCellWithIdentifier("GUserSysytemrCell", forIndexPath: indexPath)
               let cell = UITableViewCell(style: .Value1, reuseIdentifier: "GUserSysytemrCell")
        
            if indexPath.section == 0 {

                    cell.textLabel?.textColor = kTitleLabelColor
                    cell.textLabel?.font = kTitleLabelFont
                    if indexPath.row == 0   {
                        cell.textLabel!.text = "当前版本"
                        cell.detailTextLabel?.text = "V2.0"
                        cell.detailTextLabel?.font = kDetailLabelFont
                    } else {
                        cell.textLabel!.text = "意见反馈"
                        cell.accessoryView = UIImageView(image: UIImage(named: "all_icon_go"))
                    }
                  return cell
                }
        
                if indexPath.section == 1 {
                let logOutCell : GUserSystemLogOutCell =  tableView.dequeueReusableCellWithIdentifier("GUserSystemLogOutCell", forIndexPath: indexPath) as! GUserSystemLogOutCell
                    return logOutCell
                }

       return cell
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0  {
            if  indexPath.row == 1{
            let feedBack = GUserFeedBackController()
            self.navigationController?.pushViewController(feedBack, animated: true)
        }
    }
        
        if indexPath.section == 1 {
            AppDelegate.enterLoginController()
        }

        tableView.deselectRowAtIndexPath(indexPath, animated: true)
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
