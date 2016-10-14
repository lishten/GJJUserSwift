//
//  GUserBaseTabbarController.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/5.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class GUserBaseTabbarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAllChildViewController()

        self.tabBar.tintColor = UIColor.whiteColor()
        self.tabBar.translucent = false
    
        self.setValue(MainTabBar(), forKey: "tabBar")
        self.selectedIndex = 0
    }
    
    /// 初始化所有子控制器
    private func setUpAllChildViewController() {
        
        //首页推荐
        tabBaraAddChildViewController(vc: GUserHomePageController(), title: "首页推荐", imageName: "dynamic_icon_1_un", selectedImageName: "dynamic_icon_1_pr")
        // 最新动态
        tabBaraAddChildViewController(vc: GUserFeedController(), title: "装修动态", imageName: "dynamic_icon_2_un", selectedImageName: "dynamic_icon_2_pr")
        // 施工计划
        tabBaraAddChildViewController(vc: GUserConstructController(), title: "施工计划", imageName: "dynamic_icon_3_un", selectedImageName: "dynamic_icon_3_pr")
        // 个人中心
        tabBaraAddChildViewController(vc: GUserCenterControllerViewController(), title: "个人中心", imageName: "dynamic_icon_4_un", selectedImageName: "dynamic_icon_4_pr")
    }
    
    private func tabBaraAddChildViewController(vc vc: UIViewController, title: String, imageName: String, selectedImageName: String) {
        vc.tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), selectedImage: UIImage(named: selectedImageName))
        vc.tabBarItem.title = title
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : kCommonColor], forState: .Selected)
        vc.tabBarItem.image = UIImage(named: imageName)?.imageWithRenderingMode(.AlwaysOriginal)
        vc.tabBarItem.selectedImage = UIImage(named: selectedImageName)?.imageWithRenderingMode(.AlwaysOriginal)
        vc.view.backgroundColor = kBackgroundGrayColor
        let nav = GUserBaseNavController(rootViewController: vc)
        addChildViewController(nav)
    }
}

class MainTabBar: UITabBar {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translucent = false
        self.backgroundImage = UIImage(named: "")
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
}
