//
//  UIColor+gjjColor.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/5.
//  Copyright © 2015年 Lishten. All rights reserved.
//
import UIKit
import Foundation

// UIColor的扩展
extension UIColor {
    class func colorWith(red: Int, green: Int, blue: Int, alpha: CGFloat) -> UIColor {
        let color = UIColor(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: alpha)
        return color
    }
    
    class func UIColorFromRGB(rgbValue:CUnsignedLongLong) -> UIColor {
        let r =  CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgbValue & 0xFF00) >> 8) / 255.0
        let b = CGFloat(rgbValue & 0xFF) / 255.0
        let color = UIColor.init(red: r, green:g, blue: b, alpha: 1.0)
        return color
    }

}

