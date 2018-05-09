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
    public class func registerThemeToastView<T:SDToastViewDelegate>(withFrame frame:CGRect, delegate:T? = nil){
        let toastView = SDThemeToastView.sharedInstance()
        toastView.frame = frame
        toastView.delegate = delegate
        sdToastView = toastView
    }
    
    /**
     设置弹窗的内容
     - parameter centerView:  使用者自定义中间的展示区域
     - parameter left:  左边按钮文字
     - parameter right:  右边按钮文字
     - parameter topTips:  上面提示文字
     - returns:    Void
     */
    public class func showToastViewWith(centerView :UIView, withLeftTitle left:String, rightTitle right:String, topTips:String){
        if sdToastView == nil {
            sdToastView = SDThemeToastView.sharedInstance()
        }
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
