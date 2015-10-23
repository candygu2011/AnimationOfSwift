//
//  MyButton.swift
//  Animation
//
//  Created by hi on 15/10/13.
//  Copyright (c) 2015年 GML. All rights reserved.
//

import UIKit
enum MyButtonAnimationType {
    case AnimationTypeScale
    case AnimationTypeRotate
}

class MyButton: UIButton {
    //---------------变量 、常量 -------------------//
    // 正常颜色
    private var normal_bgColor = UIColor(red: CGFloat(237 / 255.0), green: CGFloat(85 / 255.0), blue: CGFloat(101 / 255.0), alpha: 1)
    //  倒计时中的颜色
    var enable_bgColor = UIColor.lightGrayColor()
    private var timer:NSTimer!
    private var startCount = 0
    private var originNum = 0
    //  倒计时label
    private var timeLabel = UILabel()
    var animationType = MyButtonAnimationType.AnimationTypeScale
    
    
    //***********方法************//
    convenience init(count: Int,frame:CGRect, var color:UIColor?) {
        self.init(frame:frame)
        self.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        self.titleLabel?.font = UIFont.systemFontOfSize(17)
        // 如果设定的有color 就显示设置的color 没有显示默认颜色
        if color == nil {
            color = normal_bgColor
        } else {
            normal_bgColor = color!
        }
        self.backgroundColor = normal_bgColor
        self.startCount = count
        self.originNum = count
        addLabel()
        super.addTarget(self, action: "startCountDown", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    //  倒计时的label
    func  addLabel() {
        timeLabel.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))
        timeLabel.backgroundColor = UIColor.clearColor()
        timeLabel.font = UIFont.systemFontOfSize(17.0)
        timeLabel.textAlignment = NSTextAlignment.Center
        timeLabel.text = "\(self.originNum)"
        self.addSubview(timeLabel)
    }
    // 开启定时器
    func startCountDown(){
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "countDown", userInfo: nil, repeats: true)
        self.backgroundColor = enable_bgColor
        self.enabled = false
        
        switch self.animationType {
        case .AnimationTypeScale :
            self.scaleAnimation()
        case .AnimationTypeRotate :
            self.rorateAnimation()
        }
        
    }
    
    // 开始倒计时
    func countDown() {
        self.startCount--
        timeLabel.text = "\(self.startCount)"
        
        //  倒计时完成后停止定时器，移除动画
        if self.startCount < 0 {
            if self.timer == nil {
                return
            }
            timeLabel.layer.removeAllAnimations()
            timeLabel.text = "\(self.originNum)"
            self.timer.invalidate()
            self.timer = nil
            self.enabled = true
            self.startCount = self.originNum
            self.backgroundColor = normal_bgColor
            println(self.startCount)
        }
        
    }
    
    // 放大动画
    func scaleAnimation() {
        let duration: CFTimeInterval = 1
        let beginTime = CACurrentMediaTime()
        
        // scale animation 
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.keyTimes = [0,0.5,1.0]
        scaleAnimation.values = [1,1.5,2]
        scaleAnimation.duration = duration
        
        // opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.keyTimes = [0,0.5,1]
        opacityAnimation.values = [1,0.5,0]
        opacityAnimation.duration = duration
        
        let animation = CAAnimationGroup()
        animation.animations = [scaleAnimation,opacityAnimation]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = duration
        animation.repeatCount = HUGE
        animation.removedOnCompletion = false
        
        animation.beginTime = beginTime
        timeLabel.layer.addAnimation(animation, forKey: "animation")
        self.layer.addSublayer(timeLabel.layer)
        
    }
    
    // 旋转变小东南规划
    func rorateAnimation() {
        let duration:CFTimeInterval = 1
        let beginTime = CACurrentMediaTime()
        
        // rotate animation
        let rotateAnimation = CABasicAnimation(keyPath: "transfrom.rotation.z")
        rotateAnimation.fromValue = NSNumber(int: 0)
        rotateAnimation.toValue = NSNumber(double: M_PI * 2)
        rotateAnimation.duration = duration
        
        // scale animation
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation.keyTimes = [0]
        scaleAnimation.values = [1,2]
        scaleAnimation.duration = 0
        
        // opacity animation
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.keyTimes = [0,0.5]
        opacityAnimation.values = [1,0]
        opacityAnimation.duration = duration
        
        // scale animation
        let scaleAnimation2 = CAKeyframeAnimation(keyPath: "transform.scale")
        scaleAnimation2.keyTimes = [0,0.5]
        scaleAnimation2.values = [2,0]
        scaleAnimation2.duration = duration
        
        let animationGroup = CAAnimationGroup()
        animationGroup.animations = [rotateAnimation,scaleAnimation,opacityAnimation,scaleAnimation2]
        animationGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animationGroup.duration = duration
        animationGroup.repeatCount = HUGE
        animationGroup.removedOnCompletion = false
        animationGroup.beginTime = beginTime
        self.timeLabel.layer.addAnimation(animationGroup, forKey: "animation")
        self.layer.addSublayer(self.timeLabel.layer)
        
        
    }

}
