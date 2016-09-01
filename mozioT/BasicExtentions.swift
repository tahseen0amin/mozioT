//
//  BasicExtentions.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 01/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit

// extensions for adding constarints
extension UIView {
    
    func addSubViewWithConstraint(subview:UIView, inset:UIEdgeInsets) {
        let view = self
        view.addSubview(subview)
        subview.frame = CGRectMake(inset.left, inset.top, view.frame.size.width-inset.right,
                                   view.frame.size.height-inset.bottom);
        view.clipsToBounds = true;
        
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .Leading, relatedBy: .Equal, toItem: view, attribute: .Leading, multiplier: 1, constant: inset.left))
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .Trailing, relatedBy: .Equal, toItem: view, attribute: .Trailing, multiplier: 1, constant: inset.right))
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .Top, relatedBy: .Equal, toItem: view, attribute: .Top, multiplier: 1, constant: inset.top))
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .Bottom, relatedBy: .Equal, toItem: view, attribute: .Bottom, multiplier: 1, constant: inset.bottom))
    }
    
    func addSubViewInCenter(subview:UIView,size:CGSize) {
        let view = self
        let center = view.center
        view.addSubview(subview)
        subview.frame = CGRectMake(center.x-size.width/2.0,
                                   center.y-size.height/2.0, size.width, size.height)
        view.clipsToBounds = true;
        
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .CenterX, relatedBy: .Equal, toItem: view, attribute: .CenterX, multiplier: 1, constant: 0))
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .CenterY, relatedBy: .Equal, toItem: view, attribute: .CenterY, multiplier: 1, constant: 0))
        
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size.height))
        view.addConstraint(NSLayoutConstraint.init(item: subview, attribute: .Width, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: size.width))
    }
    
    func fadeIn(duration: NSTimeInterval = 0.5, delay: NSTimeInterval = 0.0, completion: ((Bool) -> Void) = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: completion)  }
    
    func fadeOut(duration: NSTimeInterval = 0.5, delay: NSTimeInterval = 0.0, completion: (Bool) -> Void = {(finished: Bool) -> Void in}) {
        UIView.animateWithDuration(duration, delay: delay, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 0.0
            }, completion: completion)
    }
}