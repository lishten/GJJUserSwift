//
//  GUserCenterCell.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/5.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserCenterCell: UITableViewCell {
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       title.font = kTitleLabelFont
       title.textColor = kTitleLabelColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
