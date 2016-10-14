//
//  GUserCenterControllerViewController.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/5.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserCenterControllerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var _userCenteTabke:UITableView!
    private lazy var headerV: [GUserCenterHeaderView] = [GUserCenterHeaderView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "个人中心"
        self.setTableView()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    func setTableView(){
    
        _userCenteTabke = UITableView(frame: view.frame, style: .Grouped)
        _userCenteTabke.delegate = self
        _userCenteTabke.dataSource = self
        //        _userCenteTabke!.registerClass(GUserCenterCell.self, forCellReuseIdentifier: "GUserCenterCell")
        _userCenteTabke!.registerNib(UINib(nibName: "GUserCenterCell", bundle:nil), forCellReuseIdentifier: "GUserCenterCell")
        //
        //        let headerV = NSBundle.mainBundle().loadNibNamed("GUserCenterHeaderView", owner: nil, options: nil).last as! GUserCenterHeaderView
        //        headerV.frame = CGRectMake(0, 0,UIScreen .mainScreen().bounds.width, 95)
        
        _userCenteTabke.tableHeaderView = GUserCenterHeaderView.userCenterHeaderViewFromXib()
        
        self.view.addSubview(_userCenteTabke)
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

      let centerCell : GUserCenterCell =  tableView.dequeueReusableCellWithIdentifier("GUserCenterCell", forIndexPath: indexPath) as! GUserCenterCell
        
        if indexPath.section == 0 {
            if indexPath.row == 0   {
                centerCell.title!.text = "我的设计方案"
                centerCell.leftImage?.image = UIImage(named: "personal_icon_1")
            } else {
                centerCell.title!.text = "我的装修保障"
                centerCell.leftImage?.image = UIImage(named: "personal_icon_2")
            }
            return centerCell
        }
        
        if indexPath.section == 1 {
            centerCell.title!.text = "施工问题反馈"
            centerCell.leftImage?.image = UIImage(named: "personal_icon_3")
            return centerCell
        }
        
        if indexPath.section == 2 {
            centerCell.title!.text = "系统设置"
            centerCell.leftImage?.image = UIImage(named: "personal_icon_4")
            return centerCell
        }
    //系统cell使用
//        let cell = tableView .dequeueReusableCellWithIdentifier("GUserCenterCell", forIndexPath: indexPath) as! GUserCenterCell
//        if indexPath.section == 0 {
//            if indexPath.row == 0   {
//                cell.textLabel!.text = "我的设计方案"
//                cell.imageView?.image = UIImage(named: "personal_icon_1")
//            } else {
//                cell.textLabel!.text = "我的装修保障"
//                cell.imageView?.image = UIImage(named: "personal_icon_2")
//            }
//          return cell
//        }
//        
//        if indexPath.section == 1 {
//            cell.textLabel!.text = "施工问题反馈"
//            cell.imageView?.image = UIImage(named: "personal_icon_3")
//            return cell
//        }
//        
//        if indexPath.section == 2 {
//            cell.textLabel!.text = "系统设置"
//            cell.imageView?.image = UIImage(named: "personal_icon_4")
//            return cell
//        }
        
        return centerCell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        if section == 0 {
            return 2
        } else {
            return 1
        }
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
        if indexPath.section == 0 {
            if indexPath.row == 1 {
             let supportVc = GUserSupportController()
                self.navigationController?.pushViewController(supportVc, animated: true)
            }
        }
        if indexPath.section == 1 {
           let feedBackVc = GUserConstructionFeedbackController()
            self.navigationController?.pushViewController(feedBackVc, animated: true)
        }
        if indexPath.section == 2 {
            let systemVc = GUserSystemSettingController()
            self.navigationController?.pushViewController(systemVc, animated: true)
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
