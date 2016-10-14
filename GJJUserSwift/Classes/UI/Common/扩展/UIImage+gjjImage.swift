//
//  UIImage+gjjImage.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/12/1.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import Foundation
import UIKit

// UIImage的扩展
extension UIImage {
    class func refreshingImages(imagesName:NSArray) -> NSArray {
        var images = [UIImage]()
        for var i = 0 ; i < imagesName.count ; i++ {
           let refreshImage = UIImage(named: imagesName[i] as! String)
          images.append(refreshImage!)
        }
        return images
    }    
}