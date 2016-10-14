//
//  GAlertMessageManager.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/12/10.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit
typealias handleBlock = (UIAlertView,Int) -> ()

class GAlertMessageManager: NSObject,UIAlertViewDelegate {
    
    var alertView:UIAlertView!
    var aiView:UIActivityIndicatorView!
    
    //MARK: - 懒加载
    lazy var mbProgressHUD: MBProgressHUD = {
        let mbProgressHUD = MBProgressHUD ()
        return mbProgressHUD
    }()
    
    //MARK:单例
    class var shareInstance: GAlertMessageManager {
        get {
            struct Static {
                static var instance: GAlertMessageManager? = nil
                static var token: dispatch_once_t = 0
            }
            dispatch_once(&Static.token, {
                Static.instance = GAlertMessageManager()
            })
            return Static.instance!
        }
    }
    
    func showError(error:String) {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            print("showError当前线程\(NSThread .currentThread())")
            self.mbProgressHUD.showError(error, toView: nil)
        }
    }
    
    func showSuccess(success:String) {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.mbProgressHUD.showSuccess(success, toView: nil)
        }
    }
    
    func showAlertView(message:String,cancleTitle:String, other:String,handle:handleBlock) -> () {
        if (self.alertView != nil) {
            self.alertView.alpha = 0
            self.alertView.removeFromSuperview()
            self.alertView.dismissWithClickedButtonIndex(0, animated: true)
            self.alertView = nil
        }
        
        self.alertView = UIAlertView(title: "提示", message: message, delegate: self, cancelButtonTitle: cancleTitle, otherButtonTitles: other)
        self.alertView.delegate = self
        self.alertView.show()
        self.alertView.bk_didDismissBlock = {(alert:UIAlertView!, index:Int) in
            handle(alert, index)
        }
    }
    
    func showMessage(message:String) {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.mbProgressHUD.showMessag(message)
        }
    }
    
    func submitView() {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.mbProgressHUD.showMessag("加载中", toView: nil)
        }
    }
    func hidSubmitView() {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            MBProgressHUD.hideAllHUDsForView(nil, animated: true)
        }
    }
    
    func submitViewMessage(message:String) {
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            self.mbProgressHUD.hidden = false
            self.mbProgressHUD.showMessag(message, toView: nil)
        }
    }
    
    func alertView(alertView: UIAlertView, didDismissWithButtonIndex buttonIndex: Int) {
        self.alertView = nil
    }
    
}
