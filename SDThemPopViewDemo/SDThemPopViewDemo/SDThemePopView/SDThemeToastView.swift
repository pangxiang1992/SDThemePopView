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
        customView.frame = contentView.bounds
        contentView.addSubview(customView)

        leftBtn.titleLabel?.text = left
        rightBtn.titleLabel?.text = right
        topTipsLab.text = topTips
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
