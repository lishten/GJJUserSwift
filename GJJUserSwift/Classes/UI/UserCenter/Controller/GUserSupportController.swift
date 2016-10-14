//
//  GUserSupportController.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/6.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserSupportController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "我的装修保障"
        self.view.backgroundColor = kBackgroundGrayColor
        
        let supportView = GUserSupportView.userSupportView()
        self.view.addSubview(supportView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
