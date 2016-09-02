//
//  BaseView.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 02/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit

class BaseView: UIView {
    
    @IBOutlet var contentView : UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonInit()
    }
    
    func commonInit() {
        let xibFileName = String(self.dynamicType).componentsSeparatedByString("__").last
        let view = NSBundle.mainBundle().loadNibNamed(xibFileName, owner: self, options: nil)[0] as! UIView
        contentView = view
        self.addSubViewWithConstraint(contentView!, inset: UIEdgeInsetsZero)
    }
}
