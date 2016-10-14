//
//  GNetWorkEngineDefine.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/12/15.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import Foundation

let kGNetReachableNotify      =  "kGNetReachableNotify"
let kGSocketConnectNotify     =  "kGSocketConnectNotify"
let kNotiAppPushMsg           =  "kNotiAppPushMsg"
let kNotiAppLogout            =  "kNotiAppLogout"

let kTcpConnectMaxRetryCnt    =   5         //tcp重连最大次数 3次最优ip，1次备份ip，1次域名
let kTcpConnectInterval       = 0.5       //tcp重连的间隔
let kTcpConnectDefaultTimeOut =   5        //默认超时时间

let kMaxRequestRetryCount     = 3         //请求重试最大次数
let kMaxRequestRetryTimeout   = 30 * 60   //请求重试最大超时时间

let GNetReqNoTimeOut          =  -1
let GNetReqDefaultTimeOut     =  30        //默认超时时间
let GNetReqDefaultRetryCount  = 1         //默认重试次数
let GNetReqDefaultSocketTag   = 0         //默认socketTag



enum GCurrentNetworkType:NSInteger {
    case GNotReachable           = 0    //无网络
    case GReachableViaWifi       = 1   //wifi
    case GReachableVia2G         = 2   //2G
    case GReachableVia3G         = 3   //3G
    case GReachableVia4G         = 4    //4G
}


enum GSocketConState:NSInteger {
    case GSocketConStateSucc         = 0    //连接成功
    case GSocketConStateConnecting   = 1    //正在连接
    case GSocketConStateFail         = 2    //连接失败
}

//错误码定义
enum GNetErrorCode:NSInteger {
    case    GNetErrorCodeClient     = -3       //客户端错误
    case    GNetErrorCodeCancel     = -2       //取消
    case    GNetErrorCodeDecodePack = -1       //解包失败
    case    GNetErrorCodeNone       = 0        //成功
    case    GNetErrorCodeTimeOut    = -11      //超时
    case    GNetErrorCodeMemLack    = -12      //内存不足
    case    GNetErrorCodeDisconnect = -13      //网络断开
    case    GNetErrorCodeNetUnusual = -14      //网络异常
}

//错误信息定义
let G_ERROR_DOMAIN_SERVER		= "domain.server"        //server错误
let G_ERROR_DOMAIN_CLIENT		= "domain.client"        //客户端错误
let G_ERROR_DOMAIN_TCP          = "domain.tcp"           //tcpSDK返回错误
let G_ERROR_DOMAIN_PACKET		= "domain.packet"		//数据包解包出错
let G_ERROR_DOMAIN_BUSINESS     = "domain.business"		//业务出错


let GNetRequestPrefix           = "GJJ"
let GNetRequestSuffix           = "Req"
let GNetResponsePrefix          = "GJJ"
let GNetResponseSuffix          = "Rsp"

let G_MAGIC_NUM_LENGTH          = 4
let G_HEADER_LEN_LENGTH         = 4
let G_BODY_LEN_LENGTH           = 4

let G_UI_MID                    = 102
let G_MigicNum                  = "$GJJ"


//测试专用ip
let Test_IP                 = "192.168.10.226"
/*
外网ip
@"114.67.57.99"

联调环境
@"192.168.8.111"

备份ip
@"125.88.172.175"

测试环境1
@"192.168.10.125"

测试环境2
@"192.168.10.126"

.7
@"192.168.10.7"

.8
@"192.168.10.8"

*/
