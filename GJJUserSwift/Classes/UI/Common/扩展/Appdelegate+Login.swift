//
//  Appdelegate+Login.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/27.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import Foundation
import UIKit

extension AppDelegate{
    
    
    class func enterLoginController(){
      UIView.transitionWithView(appDelegate.window!!, duration: 0.5, options: .TransitionCrossDissolve, animations: { () -> Void in
        
        }, completion: nil)
      appDelegate.window!!.rootViewController = GUserLoginController()
    }

    class func enterMainBarController(){
        appDelegate.window!?.rootViewController = GUserBaseTabbarController()
    }
}