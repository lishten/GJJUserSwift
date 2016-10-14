//
//  GUserProgressCell.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/12/8.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserProgressCell: UITableViewCell {

    @IBOutlet weak var sdProgress: UILabel!
    @IBOutlet weak var nmProgress: UILabel!
    @IBOutlet weak var yqProgress: UILabel!
    @IBOutlet weak var jgProgress: UILabel!
    
    @IBOutlet weak var sdTitle: UILabel!
    @IBOutlet weak var nmTitle: UILabel!
    @IBOutlet weak var yqTitle: UILabel!
    @IBOutlet weak var jgTitle: UILabel!
    
    var progressArr:NSArray!
    var titleArr:NSArray!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        progressArr = NSArray(objects:[sdProgress,nmProgress,yqProgress,jgProgress])
        titleArr = NSArray(objects: [sdTitle,nmTitle,yqTitle,jgTitle])
        self.setNormalUI()
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setNormalUI() {
        self.backgroundColor = kBackgroundGrayColor
        self.selectionStyle = .None
        
        self.setProgressLabelNormal(sdProgress)
        self.setProgressLabelNormal(nmProgress)
        self.setProgressLabelNormal(yqProgress)
        self.setProgressLabelNormal(jgProgress)
        
        self.setTitleLabelNormal(sdTitle)
        self.setTitleLabelNormal(nmTitle)
        self.setTitleLabelNormal(yqTitle)
        self.setTitleLabelNormal(jgTitle)
        
        self.changLabelTextColor(nmProgress)
        self.changLabelTextColor(nmTitle)
    }
    
    func setProgressLabelNormal(label:UILabel) {
        label.font = UIFont.systemFontOfSize(23)
        label.textColor = kSubTitleLbaelColor
        
    }
    
    func setTitleLabelNormal(label:UILabel) {
        label.font = UIFont.systemFontOfSize(13)
        label.textColor = kSubTitleLbaelColor
    }
    
    func changLabelTextColor(label:UILabel) {
        label.textColor = kCommonColor
    }
}
