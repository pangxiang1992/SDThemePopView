//
//  SDThemePopView.swift
//  SDThemPopViewDemo
//
//  Created by pangxiang on 5/8/18.
//  Copyright © 2018 pangxiang. All rights reserved.
//

import UIKit
import VTToastToolKit

public class SDThemeToastView: UIView {
    @IBOutlet weak var leftBtn: UIButton!
    
    @IBOutlet weak var rightBtn: UIButton!

    @IBOutlet weak var contentView: UIView!

    @IBOutlet weak var topTipsLab: UILabel!
    
    @IBOutlet weak var topViewH: NSLayoutConstraint!
    
    @IBOutlet weak var bottomViewH: NSLayoutConstraint!
    
    @IBAction func lefAction(_ sender: UIButton) {
        guard let delegateCopy = delegate else {
            SDToastViewTool.dissMissToastView()
            return
        }
        delegateCopy.leftAction?(toastView: self)
        print("leftAction")
    }
    
    @IBAction func rightAction(_ sender: UIButton) {
        guard let delegateCopy = delegate else {
            print("no delegate for rightAction")
            return
        }
        delegateCopy.rightAction?(toastView: self)
        print("rightAction")
    }
    
    var delegate :SDToastViewDelegate?
    
    override public func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setContentView(customView :UIView, andLeftTitle left:String, rightTitle right:String, topTips:String){
        //⚠️：在给customView设置约束之前需要先把他添加到试图上面去（编译器需要知道custom是在什么图成上面渲染的）
        contentView.addSubview(customView)
        setCustomViewFrame(withCustomView: customView)
        
        leftBtn.setTitle(left, for: .normal)
        rightBtn.setTitle(right, for: .normal)
        topTipsLab.text = topTips
    }
    
    func setCustomViewFrame(withCustomView customView:UIView){
        customView.translatesAutoresizingMaskIntoConstraints = false
        let layoutAtrTop = NSLayoutConstraint.init(item: customView, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 0)
        let layoutAtrBottom = NSLayoutConstraint.init(item: customView, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 0)
        let layoutAtrLeft = NSLayoutConstraint.init(item: customView, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 0)
        let layoutAtrRight = NSLayoutConstraint.init(item: customView, attribute: NSLayoutAttribute.right, relatedBy: NSLayoutRelation.equal, toItem: contentView, attribute: NSLayoutAttribute.right, multiplier: 1, constant: 0)
        NSLayoutConstraint.activate([layoutAtrTop,layoutAtrLeft,layoutAtrRight,layoutAtrBottom])
        
    }
    
    class func sharedInstance() -> SDThemeToastView {
        let nibView: SDThemeToastView = Bundle.main.loadNibNamed("SDThemeToastView", owner: self, options: nil)!.first as! SDThemeToastView
        return nibView
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
