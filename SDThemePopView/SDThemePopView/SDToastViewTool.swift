//
//  SDThemePopViewTool.swift
//  SDThemPopViewDemo
//
//  Created by pangxiang on 5/8/18.
//  Copyright © 2018 pangxiang. All rights reserved.
//
import UIKit
import Foundation
import VTToastToolKit

var sdToastView :SDThemeToastView?

//swift协议不支持可选方法，所以要加 @objc ，这样会调用cocoa的运行时 （⚠️：遵循实现该协议的时候，方法前面也要加@objc,用来告诉实现的对象调用oc的运行时，查找对应方法）
@objc public protocol SDToastViewDelegate{
    @objc optional func leftAction(toastView: SDThemeToastView)
    @objc optional func rightAction(toastView: SDThemeToastView)
}

public class SDToastViewTool{
    /**
     初始化弹窗的大小
     - parameter frame: 设置大小
     - returns:    Void
     */
    public class func registerThemeToastView(withFrame frame:CGRect){
        let toastView = SDThemeToastView.sharedInstance()
        toastView.frame = frame
        sdToastView = toastView
    }
    
    /**
     初始化弹窗代理
     - parameter delegate: toastView的代理
     - returns:    Void
     */
    public class func setToastViewDelegate(delegate:SDToastViewDelegate){
        guard let sdToastViewCopy = sdToastView else{
            return
        }
        sdToastViewCopy.delegate = delegate
    }
    
    /**
     设置上下视图的高度
     - parameter topH: 提示区高度
     - parameter bottomH: 底部区高度
     - returns:    Void
     */
    public class func layoutTopTipsH(topH:CGFloat,andBottomH bottomH:CGFloat){
        sdToastView?.topViewH.constant = topH
        sdToastView?.bottomViewH.constant = bottomH
    }
    
    /**
     设置弹窗的内容
     - parameter centerView:  使用者自定义中间的展示区域
     - parameter left:  左边按钮文字
     - parameter right:  右边按钮文字
     - parameter topTips:  上面提示文字
     - returns:    Void
     */
    public class func showToastViewWith(target:SDToastViewDelegate, centerView :UIView, LeftTitle left:String, rightTitle right:String, topTips:String){
        if sdToastView == nil {
            sdToastView = SDThemeToastView.sharedInstance()
        }
        sdToastView?.delegate = target
        sdToastView!.setContentView(customView: centerView, andLeftTitle: left, rightTitle: right, topTips: topTips)
        VTToastTool.showPopupView(withContentView: sdToastView!, andDissmissWithBackgroundTouch: true)
      
    }
    
    /**
     弹窗消失
     - returns:    Void
     */
    public class func dissMissToastView(){
        VTToastTool.dissmissPopupView()
        sdToastView = nil
    }
}
