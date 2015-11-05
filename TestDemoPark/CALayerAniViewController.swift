//
//  CALayerAniViewController.swift
//  TestDemoPark
//
//  Created by tb on 15/11/4.
//  Copyright © 2015年 Yasin. All rights reserved.
//

import UIKit

class CALayerAniViewController: UIViewController {
    let width:CGFloat = 50
    let photoWidth:CGFloat = 150
    let imageView = UIImageView(frame: CGRectMake(100, 100, 50, 50))
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "20150727091942")
        self.view.addSubview(imageView)
        
        // Do any additional setup after loading the view.
//        drawMyLayer()
        
//        let position = CGPointMake(160, 200)
//        let bounds = CGRectMake(0, 0, photoWidth, photoWidth)
//        
//        let layerShadow = CALayer()
//        layerShadow.bounds = bounds
//        layerShadow.position = position
//        layerShadow.cornerRadius = photoWidth/2
//        layerShadow.shadowColor = UIColor.grayColor().CGColor
//        layerShadow.shadowOffset = CGSizeMake(2, 1)
//        layerShadow.shadowOpacity = 1
//        layerShadow.borderColor = UIColor.redColor().CGColor
//        layerShadow.borderWidth = 2
//        self.view.layer.addSublayer(layerShadow)
//        
//        let layer = CALayer()
//        layer.bounds = bounds
//        layer.position = position
//        layer.backgroundColor = UIColor.grayColor().CGColor
//        layer.cornerRadius = photoWidth/2
//        //仅仅设置圆角对于图形而言是可以正常显示的，但是对于图层中绘制的图片无法正确显示
//        //如果想要正确显示则必须设置masksToBounds,剪切子图层
//        layer.masksToBounds = true
//        //阴影效果无法和maskToBounds同时使用，因为masksToBounds的目的就是剪切外边框
//        //而阴影效果刚好在外边框
//        
//        //设置边框
//        layer.borderColor = UIColor.blackColor().CGColor
//        layer.borderWidth = 1
////        //设置图层代理
////        layer.delegate = self
////        //利用图层形变解决图像倒立问题
////        layer.transform = CATransform3DMakeRotation(CGFloat(M_PI), 1, 0, 0)
//        let image = UIImage(named: "20150727091942")?.CGImage
//        layer.contents = image
//        //添加图层到根图层
//        self.view.layer.addSublayer(layer)
//        //调用图层setNeedDisplay,否则代理方法不会被调用
////        layer.setNeedsDisplay()
        
    }
//    override func drawLayer(layer: CALayer, inContext ctx: CGContext) {
//        CGContextSaveGState(ctx)
//        //图形上下文变形，解决图片倒立问题
////        CGContextScaleCTM(ctx, 1, -1)
////        CGContextTranslateCTM(ctx, 0, -photoWidth)
//        
//        let image = UIImage(named: "20150727091942")?.CGImage
//        CGContextDrawImage(ctx, CGRectMake(0, 0, photoWidth, photoWidth), image)
//        CGContextRestoreGState(ctx)
//    }
//    func drawMyLayer() {
//        let size = UIScreen.mainScreen().bounds.size
//        let layer = CALayer()
//        //设置背景颜色
//        layer.backgroundColor = UIColor(red: 0, green: 146.0/255.0, blue: 1.0, alpha: 1.0).CGColor
//        //设置中心点
//        layer.position = CGPointMake(size.width/2, size.height/2)
//        //设置大小
//        layer.bounds = CGRectMake(0, 0, width, width)
//        //设置圆角，当圆角半径等于矩形的一半时看起来就是一个圆形
//        layer.cornerRadius = width/2
//        //设置阴影
//        layer.shadowColor = UIColor.grayColor().CGColor
//        layer.shadowOffset = CGSizeMake(2, 2)
//        layer.shadowOpacity = 0.9
//        self.view.layer.addSublayer(layer)
//    }
//    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
//        if let touch = (touches as NSSet).allObjects.last as? UITouch {
//            if let layer = self.view.layer.sublayers?.last {
//                var widths = layer.bounds.width
//                if widths == width {
//                    widths = width*4
//                } else {
//                    widths = width
//                }
//                layer.bounds = CGRectMake(0, 0, widths, widths)
//                layer.position = touch.locationInView(self.view)
//                layer.cornerRadius = widths/2
//            }
//            
//        }
//        
//        
//        
//    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = (touches as NSSet).allObjects.last as? UITouch {
            /*创建弹性动画
            damping:阻尼，范围0-1，阻尼越接近于0，弹性效果越明显
            velocity:弹性复位的速度
            */
            let damping:CGFloat = 0.2
            let velocity:CGFloat = 3.0
            UIView.animateWithDuration(3.0, delay: 0, usingSpringWithDamping: damping, initialSpringVelocity: velocity, options: UIViewAnimationOptions.CurveLinear, animations: { () -> Void in
                self.imageView.center = touch.locationInView(self.view)
                }, completion: nil)
            
            
        }
        
        
        
    }

    
}
