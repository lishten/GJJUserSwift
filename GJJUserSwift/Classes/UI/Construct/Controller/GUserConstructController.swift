//
//  GUserConstructController.swift
//  GJJUserSwift
//
//  Created by Lishten on 15/11/9.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

let kConpPlanIndex:NSInteger = 0
let kConProgressIndex:NSInteger = 1
let kConSiteIndex:NSInteger = 2

class GUserConstructController: UIViewController,UIScrollViewDelegate {
  
    @IBOutlet weak var progressBtn: UIButton!
    @IBOutlet weak var planBtn: UIButton!
    @IBOutlet weak var siteBtn: UIButton!
    @IBOutlet weak var btnBottonLine: UIView!
    
    var tapView:UIView!
    var conScrollView:UIScrollView!
    
    var conPlanView:GUserConPlanView!
    var conProgerssView:GUserConProgerssView!
    var conSiteView:GUserConSiteView!
    
    var totalProgress:Int!
    var progress:Int!
    
    lazy var timer: NSTimer = {
        
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: "setProgressLabelText", userInfo: nil, repeats: true)
        return timer
    }()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?){
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    convenience  init() {
        
        let nibNameOrNil = String?("GUserConstructController")
        self.init(nibName: nibNameOrNil, bundle: nil)
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "施工计划"
      
        self.setUI()
        self.setBtnUI()
        self.setConScrollView()
        self.setConPlanView()
        self.setConProgerssView()
        self.setConSiteView()
    }
    
    func setUI(){
        tapView = UIView(frame: CGRectMake(0, 38, UI_SCREEN_WIDTH/3, 2))
        tapView.backgroundColor = kCommonColor
        self.view.addSubview(tapView)
        btnBottonLine.backgroundColor = kLineColor
    }
    
    // MARK: - TopBtnSet
    func setBtnUI(){
        self .setBtnProperty(planBtn)
        self .setBtnProperty(progressBtn)
        self .setBtnProperty(siteBtn)
        self .changeSelectedBtnTitleColor(planBtn)
    }
    
    func setBtnProperty(btn:UIButton){
        btn.titleLabel?.font = kDetailLabelFont
        btn.backgroundColor = kBackgroundWhiteColor
        btn.addTarget(self, action: "btnClick:", forControlEvents: .TouchUpInside)
    }
    
    func changeSelectedBtnTitleColor(btn:UIButton){
        planBtn.setTitleColor(kSubTitleLbaelColor, forState: .Normal)
        progressBtn.setTitleColor(kSubTitleLbaelColor, forState: .Normal)
        siteBtn.setTitleColor(kSubTitleLbaelColor, forState: .Normal)
        btn.setTitleColor(kCommonColor, forState: .Normal)
    }

    func btnClick(btn:UIButton){
        self.changeSelectedBtnTitleColor(btn)
        let index:Int = btn.tag - 100
        
        var frame:CGRect = tapView.frame
        frame.origin.x = CGFloat(index) * (UI_SCREEN_WIDTH / 3)
        let point:CGPoint = CGPointMake(CGFloat(index) * UI_SCREEN_WIDTH, 0)
        self.doTapViewScrollTo(frame, point: point)
    }
    func doTapViewScrollTo(frame:CGRect, point:CGPoint){
        UIView.animateWithDuration(0.3) { () -> Void in
            self.conScrollView.contentOffset = point
            self.tapView.frame = frame
        }
    
    }
    
    // MARK: - ScrollViewSet
    func setConScrollView(){
        conScrollView = UIScrollView(frame: CGRectMake(0, 40, UI_SCREEN_WIDTH, UI_SCREEN_HEIGHT - 150))
        conScrollView.delegate = self
        conScrollView.contentSize = CGSizeMake(3 * UI_SCREEN_WIDTH, 0)
        conScrollView.contentOffset = CGPointMake(0, 0)
        conScrollView.pagingEnabled = true
        conScrollView.showsHorizontalScrollIndicator = false
        conScrollView.bounces = false
        self.view.addSubview(conScrollView)
    }
    
    // MARK: -TableViewSet
    func setConPlanView(){
       conPlanView = GUserConPlanView.init(frame: CGRectMake(0, 0, UI_SCREEN_WIDTH, conScrollView.frame.size.height), style: .Grouped)
       conScrollView.addSubview(conPlanView)
        //设置下拉刷新
        let header =  GUserRefreshNorMalHeader(refreshingTarget: self, refreshingAction: "loadPlanData")
        conPlanView.mj_header = header
    }
    
    func setConProgerssView(){
        conProgerssView = GUserConProgerssView.init(frame: CGRectMake(UI_SCREEN_WIDTH, 0, UI_SCREEN_WIDTH, conScrollView.frame.size.height), style: .Grouped)
        conProgerssView.backgroundColor = kBackgroundGrayColor
        conProgerssView.tableHeader.circleProgressView.progress = 0
        conScrollView.addSubview(conProgerssView)
        //设置下拉刷新
        let header =  GUserRefreshNorMalHeader(refreshingTarget: self, refreshingAction: "loadProgressData")
        conProgerssView.mj_header = header
    }
    
    func setConSiteView(){
      
        let flowLayout = UICollectionViewFlowLayout()
        let itemW:CGFloat = (UI_SCREEN_WIDTH - 40) / 4
        flowLayout.itemSize = CGSizeMake(itemW, itemW)
        flowLayout.scrollDirection = UICollectionViewScrollDirection.Vertical
        flowLayout.minimumInteritemSpacing = 5
        flowLayout.minimumLineSpacing = 5
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 12.5,0, 12.5)
        flowLayout.headerReferenceSize = CGSizeMake(UI_SCREEN_WIDTH, 45)
        
        conSiteView = GUserConSiteView.init(frame: CGRectMake(UI_SCREEN_WIDTH * 2, 0, UI_SCREEN_WIDTH, conScrollView.frame.size.height - 5), collectionViewLayout: flowLayout)
         conScrollView.addSubview(conSiteView)
        //设置下拉刷新
        let header =  GUserRefreshNorMalHeader(refreshingTarget: self, refreshingAction: "loadSiteData")
        conSiteView.mj_header = header
    }
    
    func loadPlanData(){
        print("刷新")
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
            self.conPlanView.mj_header.endRefreshing()
            self.conPlanView .reloadData()
        })
        
    }
    func loadProgressData(){
        print("刷新")
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
            self.conProgerssView.mj_header.endRefreshing()
            self.conProgerssView.tableHeader.circleProgressView.progress = 0.5
            self.conProgerssView.tableHeader.circleProgressView.startAnimation()
            self.conProgerssView .reloadData()
        })
        
    }
    func loadSiteData(){
        print("刷新")
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1.0 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
            self.conSiteView.mj_header.endRefreshing()
            self.conSiteView .reloadData()
        })
        
    }
    // MARK: - ScrollViewDelegate
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let leftMargin:CGFloat = conScrollView.contentOffset.x / UI_SCREEN_WIDTH
        let sginViewWidth = UI_SCREEN_WIDTH/3
        var frame:CGRect = tapView.frame
        frame.origin.x = leftMargin * sginViewWidth
        self.tapView.frame = frame
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self .reLayoutSubview()
    }
    
    func getCurrentViewIndex() -> NSInteger{
    
        let index:NSInteger = NSInteger(conScrollView.contentOffset.x / UI_SCREEN_WIDTH)
        return index
    }
    
    func reLayoutSubview(){
        let index:NSInteger = self.getCurrentViewIndex()
        switch index {
        case kConpPlanIndex:
            self.changeSelectedBtnTitleColor(planBtn)
        case kConProgressIndex:
            self.changeSelectedBtnTitleColor(progressBtn)
        case kConSiteIndex:
            self.changeSelectedBtnTitleColor(siteBtn)
        default:
      break   }
    }
    
//    func startProgressAnimation(){
//      let index = self.getCurrentViewIndex()
//        switch (index) {
//        case kConProgressIndex:
//            if totalProgress == progress {
//             self.timer.invalidate()
//            } else {
//             self.timer.fire()
//            }
//            break;
//        default:
//            break;
//        }
//    }
//    func setProgressLabelText() {
//        let unit = "%"
//        if progress == totalProgress {
//           let  tempStr = "\(totalProgress)"
//           conProgerssView.tableHeader.currentProgress.text = tempStr + unit
//            timer.invalidate()
//        } else {
//           let tempStr = "\(progress)"
//           progress + 1
//           conProgerssView.tableHeader.circleProgressView.progress = Double(progress)
//        }
//    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
