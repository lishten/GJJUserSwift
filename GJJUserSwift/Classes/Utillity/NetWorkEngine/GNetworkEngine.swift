//
//  GNetworkEngine.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/12/15.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit
class GNetworkEngine: NSObject,GCDAsyncSocketDelegate {

    var socket:GCDAsyncSocket!
    var socketConState:GSocketConState!
    var reConnectIndex:Int!
    var observers:NSMutableArray!
    
    var curEnableIP:String!
    var optimalIP:String!
    var backupIP:String!
    var dnsIP:String!
    
    //MARK:单例
    class var shareInstance: GNetworkEngine {
        get {
            struct Static {
                static var networkEngine: GNetworkEngine? = nil
                static var token: dispatch_once_t = 0
            }
            dispatch_once(&Static.token, {
                Static.networkEngine = GNetworkEngine()
            })
            return Static.networkEngine!
        }
    }
  
    override init() {
        super.init()
        self.observers = NSMutableArray()
        self.socketConState = GSocketConState.GSocketConStateFail
        self.reConnectIndex = 0
        self.socket = GCDAsyncSocket(delegate: self, delegateQueue: dispatch_get_main_queue())
        self.curEnableIP = self.optimalIP
    }
    
   //MARK: 观察者
    func registerObserver(observer:AnyObject) {
       self.observers.addObject(observer)
    }
    
    func removeObserver(observer:AnyObject) {
       self.observers.removeObject(observer)
    }
    
    func didNotifyConnectSucc() {
        
    
    }
}
