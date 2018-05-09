//
//  ViewController.swift
//  SDThemPopViewDemo
//
//  Created by pangxiang on 5/8/18.
//  Copyright © 2018 pangxiang. All rights reserved.
//

import UIKit
import VTToastToolKit
class ViewController: UIViewController,SDToastViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        SDToastViewTool.registerThemeToastView(withFrame: CGRect.init(x: 0, y: 0, width: 800, height: 650))
        SDToastViewTool.layoutTopTipsH(topH: 60, andBottomH: 60)
        
        let label = UILabel.init()
        label.text = "Hell world"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor.red
        label.backgroundColor = UIColor.black
        
        SDToastViewTool.showToastViewWith(target: self, centerView: label, LeftTitle: "取消", rightTitle: "确定", topTips: "温馨提示")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func leftAction(toastView: SDThemeToastView) {
        SDToastViewTool.dissMissToastView()
    }
    func rightAction(toastView: SDThemeToastView) {
        SDToastViewTool.dissMissToastView()
    }

}

