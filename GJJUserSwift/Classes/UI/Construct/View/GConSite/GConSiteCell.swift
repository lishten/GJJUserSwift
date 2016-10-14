//
//  GConSiteCell.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/10.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GConSiteCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    let imageName: [String] = ["http://i0.sinaimg.cn/hs/2011/1214/U5018P1030DT20111214103032.jpg",
        "http://pic15.nipic.com/20110623/7126424_034442479144_2.jpg",
        "http://pic15.nipic.com/20110623/7126424_034442479144_2.jpg",
        "http://pic23.nipic.com/20120824/10795436_163120208160_2.jpg",
        "http://pic21.nipic.com/20120602/6810129_121807688174_2.jpg",
        "http://img.jgzyw.com:8000/d/img/tupian/2014/05/07/20130821_ab1ad5a984a27cd08bc9QM1eoUNPKBkE.jpg"]
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let imagename = self.randomInRange(0...5)
        image.sd_setImageWithURL(NSURL(string: imageName[imagename]), placeholderImage: UIImage(named: "blank_img_default_grey"))
    }
    
    func randomInRange(range: Range<Int>) -> Int {
        let count = UInt32(range.endIndex - range.startIndex)
        return  Int(arc4random_uniform(count)) + range.startIndex
    }
}
