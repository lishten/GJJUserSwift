//
//  GUserSystemLogOutCell.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/6.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserSystemLogOutCell: UITableViewCell {

    @IBOutlet weak var logOut: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        logOut.text = "退出登录"
        logOut.textAlignment = .Center
        logOut.textColor = kTitleLabelColor
        logOut.font = kTitleLabelFont
        logOut.userInteractionEnabled = false
         // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
