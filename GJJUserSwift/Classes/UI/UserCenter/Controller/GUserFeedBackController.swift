//
//  GUserFeedBackController.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/16.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserFeedBackController: ViewController,UITextViewDelegate {
    var feedBackView:UITextView!
    var backGroundView:UIView!
    var placeHolder:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "意见反馈"
        self.setNormlUI()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        feedBackView.becomeFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func setNormlUI(){
        self.backGroundView = UIView(frame: CGRectMake(0,20,UI_SCREEN_WIDTH,180))
        self.backGroundView.layer.borderWidth = 0.5
        self.backGroundView.layer.borderColor = kLineColor.CGColor
        self.view.addSubview(self.backGroundView)
        
        self.feedBackView = UITextView(frame: CGRectMake(10,15,UI_SCREEN_WIDTH - 20,150))
        self.feedBackView.delegate = self
        self.feedBackView.textColor = kTitleLabelColor
        self.feedBackView.font = kTitleLabelFont
        self.feedBackView.backgroundColor = UIColor.clearColor()
        self.feedBackView.scrollEnabled = true
        self.backGroundView.addSubview(self.feedBackView)
        
        self.placeHolder = UILabel(frame: CGRectMake(5,8,UI_SCREEN_WIDTH - 5,20))
        self.placeHolder.text = "用着不爽,吐槽一下...."
        self.placeHolder.textColor = kSubTitleLbaelColor
        self.placeHolder.font = kTitleLabelFont
        self.placeHolder.backgroundColor = UIColor.clearColor()
        self.feedBackView.addSubview(self.placeHolder)
        
        
        self.view.backgroundColor = kBackgroundGrayColor
        self.backGroundView.backgroundColor = kBackgroundWhiteColor
//        self.makeMasConstrain()
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        self.view.endEditing(true)
    }
    
    func textView(textView: UITextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool {
        if !text.isEmpty {
          self.placeHolder.hidden = true
        }
        if text == "" && range.location == 0 && range.length == 1 {
          self.placeHolder.hidden = false
        }
        return true
    }
    
    func isStringSpace() -> Bool {
        var isStringSpace = Bool()
        let whitespace = NSCharacterSet.whitespaceAndNewlineCharacterSet()
        let str = self.feedBackView.text.stringByTrimmingCharactersInSet(whitespace)
        if str.isEmpty {
        isStringSpace = false
        } else {
        
        isStringSpace = true
        }
     return isStringSpace
    }
}
