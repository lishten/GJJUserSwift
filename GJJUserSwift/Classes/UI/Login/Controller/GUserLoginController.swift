//
//  GUserLoginController.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/25.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserLoginController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var userID: UITextField!
    
    @IBOutlet weak var userPasswWord: UITextField!
    
    @IBOutlet weak var userIdLine: UIView!
    
    @IBOutlet weak var userPasswordLine: UIView!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    @IBOutlet weak var bkView: UIView!
    
    @IBOutlet weak var cancleLogin: UIButton!
    
    @IBOutlet weak var upView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUI()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.userID.resignFirstResponder()
        self.userPasswWord.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    convenience  init() {
        
        let nibNameOrNil = String?("GUserLoginController")
        
        //考虑到xib文件可能不存在或被删，故加入判断
        
//        if NSBundle.mainBundle().pathForResource(nibNameOrNil, ofType: "xib") == nil
//            
//        {
//            
//            nibNameOrNil = nil
//            
//        }
        
        self.init(nibName: nibNameOrNil, bundle: nil)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func  setUI(){
        self.userIdLine.backgroundColor = kLineColor
        self.userPasswordLine.backgroundColor = kLineColor
        self.loginBtn.backgroundColor = kCommonColor
        self.loginBtn.titleLabel?.font = kTitleLabelFont
        self.loginBtn.layer.cornerRadius = 5
        
        let tapDowm = UITapGestureRecognizer(target: self, action: "packUpKeyBoard")
        self.bkView.addGestureRecognizer(tapDowm)
        
        self.cancleLogin.addTarget(self, action: "cancleBtnClick", forControlEvents: .TouchUpInside)
        
        self.loginBtn.addTarget(self, action: "goMainTabar", forControlEvents: .TouchUpInside)
        
        self.setTextFileNormal(self.userID)
        self.setTextFileNormal(self.userPasswWord)
        self.bkView.userInteractionEnabled = true
    }

    func  setTextFileNormal(textFiled:UITextField){
       textFiled.font = kTitleLabelFont
       textFiled.textColor = UIColor.UIColorFromRGB(0x404040)
      
//       //设置提示文字颜色
//       textFiled.setValue(UIColor.UIColorFromRGB(0x404040), forKey: "_placeholderLabel.textColor")
//        textFiled.setValue(UIFont.systemFontOfSize(16), forKey: "_placeholderLabel.font")
        
    }
    
    
    func cancleBtnClick(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func goMainTabar(){
        GAlertMessageManager.shareInstance.submitView()
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
            GAlertMessageManager.shareInstance.hidSubmitView()
              AppDelegate.enterMainBarController()
            
        })
      
    }

    func packUpKeyBoard(){
        self.userID.resignFirstResponder()
        self.userPasswWord.resignFirstResponder()
        UIView.animateWithDuration(0.2) { () -> Void in
        var frame = CGRect()
        frame.origin.y = 0
        self.upView.constant = 0
        self.bkView.frame = frame
        
        }
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        textField .becomeFirstResponder()
        
        UIView.animateWithDuration(0.2) {  () -> Void in
            var frame = CGRect()
            frame.origin.y = -175
            self.upView.constant = -175
            self.bkView.frame = frame

        }
    }
}
