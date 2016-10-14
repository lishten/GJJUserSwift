//
//  GUserConSiteView.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/10.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserConSiteView: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate {
   
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.dataSource = self
        self.delegate = self
        self.backgroundColor = kBackgroundGrayColor
        self.showsVerticalScrollIndicator = false
        self.registerNib(UINib(nibName: "GConSiteCell", bundle:nil), forCellWithReuseIdentifier: "GConSiteCell")
        self.registerNib(UINib(nibName: "GConSiteSectionHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "GConSiteSectionHeader")
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
       return section * 2 + 1
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        let cell:GConSiteCell = collectionView.dequeueReusableCellWithReuseIdentifier("GConSiteCell", forIndexPath: indexPath) as! GConSiteCell
      return cell
    }
   
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
     
        var reusableView = UICollectionReusableView()
        // MARK: 判断处理
//        if kind  == UICollectionElementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "GConSiteSectionHeader", forIndexPath: indexPath) as! GConSiteSectionHeader
            
            reusableView = headerView
        
//        }
        return reusableView
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("你点击的是第\(indexPath.item)张图片")
        let alert = UIAlertView(title: "", message: "你点击的是第\(indexPath.item)张图片", delegate: self, cancelButtonTitle: "确定")
        alert.show()
    }
}
