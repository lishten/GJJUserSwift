//
//  GUserConstructionFeedbackController.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/6.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserConstructionFeedbackController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate{

    var feedBackTable:UITableView!
    var titleArray:[String] = ["联系设计师-张若","联系监理-王元峰","联系工长-陈续","联系客服"]
    var subTitle:[String] = ["方案设计、报价等","验收查询、巡检等","施工工艺、流程等","投诉、售前售后咨询等"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "施工问题反馈"
        self.setFeedBackTable()
        
    }

    func setFeedBackTable(){
        feedBackTable = UITableView(frame: self.view.frame, style: .Grouped)
        feedBackTable.delegate = self
        feedBackTable.dataSource = self
        feedBackTable!.registerNib(UINib(nibName: "GUserConstructFeedBackCell", bundle: nil), forCellReuseIdentifier: "GUserConstructFeedBackCell")
        self.view.addSubview(feedBackTable)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section == 0 {
           return 3
        } else {
           return 1
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell: GUserConstructFeedBackCell = tableView.dequeueReusableCellWithIdentifier("GUserConstructFeedBackCell", forIndexPath: indexPath) as! GUserConstructFeedBackCell
        if indexPath.section == 0 {
            cell.title.text = titleArray[indexPath.row]
            cell.subTitle.text = subTitle[indexPath.row]
            cell.leftImage.image = UIImage(named: "personal_img_head_default")
        } else {
            cell.title.text = titleArray[3]
            cell.subTitle.text = subTitle[3]
            cell.leftImage.image = UIImage(named: "feedback_img_service")
        }
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
      
        let alert = UIAlertView()
        alert.title = ""
        alert.delegate = self
        alert.message = "135****4680"
        alert.addButtonWithTitle("取消")
        alert.addButtonWithTitle("拨打")
        alert.show()
//
//        UIAlertView(title: "", message: "135****4680", delegate:self, cancelButtonTitle:"取消", otherButtonTitles: "拨打").show()
//        NSString *str = [NSString stringWithFormat:@"tel://%@",strPhone];
//        [UIAlertView bk_showAlertViewWithTitle:nil message:strPhone cancelButtonTitle:@"取消" otherButtonTitles:@[@"拨打"] handler:^(UIAlertView *alertView, NSInteger buttonIndex) {
//        if (buttonIndex == 1) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:str]];
//        }
//        }];
//
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        if buttonIndex == 1 {
           
          UIApplication.sharedApplication().openURL(NSURL(string: "tel://400-086-2599")!)
        
        }
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 55
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
          
           return 44
        } else {
            return 19
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let sectionView = UIView()
            sectionView.frame = CGRectMake(0, 0, UI_SCREEN_WIDTH, 44)
            sectionView.backgroundColor = kBackgroundGrayColor
            
            let title = UILabel()
            title.frame = CGRectMake(15, 20, UI_SCREEN_WIDTH, 14)
            title.text = "您可以联系一下人员进行及时反馈:"
            title.textColor = kSubTitleLbaelColor
            title.font = kDetailLabelFont
            
            sectionView.addSubview(title)
            return sectionView
        }
        return nil
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
