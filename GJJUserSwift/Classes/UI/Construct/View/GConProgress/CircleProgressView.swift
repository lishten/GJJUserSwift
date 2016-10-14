//
//  CircleProgressView.swift
//  ProgressViewDemo
//
//  Created by Lishten on 15/12/4.
//  Copyright © 2015年 Lishten. All rights reserved.
//

import UIKit

class CircleProgressView: UIControl {
    
    let progressLayer = CAShapeLayer()
    
    var  progress: CGFloat {
        get {
            return progressLayer.strokeEnd
        }
        set {
            print("New Value \(newValue)")
            if newValue > 1 {
                progressLayer.strokeEnd = 1
            } else if newValue < 0 {
                progressLayer.strokeEnd = 0
            } else {
                progressLayer.strokeEnd = newValue
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configure()
    }
    
    
    func configure(){
        self.backgroundColor = UIColor.clearColor()
        self.progressLayer.path = self.drawPathWithArcCenter()
        self.progressLayer.fillColor = UIColor.clearColor().CGColor
        self.progressLayer.lineWidth = 16
        
        self.progressLayer.path = self.drawPathWithArcCenter()
        self.progressLayer.fillColor = UIColor.clearColor().CGColor
        self.progressLayer.lineWidth = 16
        self.progressLayer.lineCap = kCALineCapRound
        self.progressLayer.lineJoin = kCALineJoinRound
        self.progressLayer.borderWidth = 0.5
        self.progressLayer.borderColor = UIColor.clearColor().CGColor
        self.progressLayer.strokeColor = kCommonColor.CGColor
        self.layer.addSublayer(self.progressLayer)
    }
    
    func drawPathWithArcCenter() -> CGPathRef{
        let position_y = self.frame.size.height / 2
        let position_x = self.frame.size.width / 2
        
        let startAge =   CGFloat(-M_PI / 2)
        let endAge = CGFloat((3 * M_PI) / 2)
        let path = UIBezierPath(arcCenter: CGPointMake(position_x, position_y), radius: position_y, startAngle:startAge, endAngle: endAge, clockwise: true).CGPath
        return path
    }
    
    func startAnimation(){
        //        self.progressLayer.strokeStart = 0.5
        //        self.progressLayer.strokeEnd = CGFloat(strokeEnd)
        let pathAnimation = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimation.duration = 3
        pathAnimation.fromValue = 0
        pathAnimation.toValue = self.progress
        print(self.progress)
        pathAnimation.removedOnCompletion = false
        self.progressLayer.addAnimation(pathAnimation, forKey: "strokeEnd")
    }
    
    override func layoutSubviews() {
        self.progressLayer.frame = self.bounds
    }
    

}
