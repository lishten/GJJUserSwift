//
//  GErrorCodeDefine.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/12/15.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import Foundation

enum GNeedHandleErrorCode:NSInteger {
   
    case USER_EXISTS           = 200000 //用户已存在
    case USER_NOT_EXISTS       = 200001 //用户不存在
    case EXPIRED_KEY           = 200102 //登录过期
    case EXPIRED_TOKEN         = 200105 //验证码已过期
    case FORCE_TO_LOGOUT       = 200107 //你已被强制下线
    
    case INVALID_SESSION       = 208000 //会话已经失效
    case EXPIRED_SESSION       = 208001 //会话已过期
    case UNKNOW_SESSION_STATUS = 208002 //无法识别的会话状态
    case INVALI_SESSION_STATUS = 208003 //无效的会话状态
   
    case UPLOAD_FILE_EXISTS    = 102001 //文件已经存在
}