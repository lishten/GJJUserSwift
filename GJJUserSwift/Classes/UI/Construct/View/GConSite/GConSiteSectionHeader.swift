//
//  GConSiteSectionHeader.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/10.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GConSiteSectionHeader: UICollectionReusableView {

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var line: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = kBackgroundGrayColor
        line.backgroundColor = kLineColor
        
        time.font = kTitleLabelFont
        time.textColor = kTitleLabelColor
        
        name.font = kDetailLabelFont
        name.textColor = kSubTitleLbaelColor
        // Initialization code
    }
    
}
