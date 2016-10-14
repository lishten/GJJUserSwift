//
//  UIStyleDefine.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/5.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import Foundation
import UIKit

public let NavigationHeight: CGFloat = 64
public let UI_SCREEN_WIDTH: CGFloat = UIScreen.mainScreen().bounds.size.width
public let UI_SCREEN_HEIGHT: CGFloat = UIScreen.mainScreen().bounds.size.height
public let MainBounds: CGRect = UIScreen.mainScreen().bounds

/************************* 颜色字体定义 *****************************/

/**
*  常用色 橙色
*/
public let kCommonColor:UIColor    = UIColor.UIColorFromRGB(0xff5500)

/**
*  背景灰色
*/
public let kBackgroundGrayColor:UIColor  = UIColor.UIColorFromRGB(0xeeeef4)
/**
*  背景白色
*/
public let kBackgroundWhiteColor:UIColor =  UIColor.UIColorFromRGB(0xffffff)

/**
*  小图白色背景
*/
public let kImageViewWhiteColor:UIColor =  UIColor.UIColorFromRGB(0xe2e2e8)

/**
*  边框颜色
*/
public let kLineColor:UIColor =  UIColor.UIColorFromRGB(0xc8c8ce)

/**
*  cell点击态颜色
*/
public let kCellSelectedColor:UIColor =  UIColor.UIColorFromRGB(0xf4f4fa)

/**
*  cell上下分割线颜色
*/
public let kCellSeparatorColor:UIColor =  UIColor.UIColorFromRGB(0xc8c8ce)


/**
*  16号字体颜色
*/
public let kTitleLabelColor:UIColor =  UIColor.UIColorFromRGB(0x202026)

/**
*  14号字体颜色
*/
public let kSubTitleLbaelColor:UIColor =  UIColor.UIColorFromRGB(0x808086)

/**
*  灰色字体颜色
*/
public let kLightGrayTextColor:UIColor =  UIColor.UIColorFromRGB(0x606066)

/**
*  其它字体颜色
*/
public let kOtherLabelColor:UIColor =  UIColor.UIColorFromRGB(0xff5500)

/**
*  16号字
*/
public let kTitleLabelFont:UIFont =  UIFont.systemFontOfSize(16)

/**
*  14号字
*/
public let kDetailLabelFont:UIFont =  UIFont.systemFontOfSize(14)
/**
*  12号字体
*/
public let kDescriptionLabelFont:UIFont =  UIFont.systemFontOfSize(12)

/**
*  上拉和下拉加载的字体颜色
*/
public let TEXT_COLOR:UIColor =  UIColor.UIColorFromRGB(0xa0a0a6)



/**
*  AppDelegate
*/
public  let appDelegate = UIApplication.sharedApplication().delegate!