//
//  BaseViewController.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 01/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit


class BaseViewController: UIViewController {
    
    // MARK:  showing alert on view controller  --
    func showOKAlert(text:String) {
        let alert = UIAlertController.init(title: "Alert", message:text , preferredStyle: .Alert)
        alert.addAction(UIAlertAction.init(title: "Dismiss", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    func showOKAlert(text:String,completion:(UIAlertAction)->Void) {
        let alert = UIAlertController.init(title: "Alert", message:text , preferredStyle: .Alert)
        alert.addAction(UIAlertAction.init(title: "Dismiss", style: .Default, handler: completion))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func startActivityIndicator() {
        self.view.userInteractionEnabled = false
        // custom indicator to be added
    }
    
    func stopActivityIndicator() {
        self.view.userInteractionEnabled = true
    }
    
    func setupNavigation() {
        if self.navigationController != nil {
            let fixedItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
            fixedItem.width = 0;
            let backButton = UIButton(type: .Custom)
            backButton.setImage(UIImage(named: "back_btn"), forState: .Normal)
            backButton.addTarget(self.navigationController, action: #selector(UINavigationController.popViewControllerAnimated(_:)), forControlEvents: .TouchUpInside)
            backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 25)
            let backBarButton = UIBarButtonItem(customView: backButton)
            self.navigationItem.leftBarButtonItem = backBarButton
        } else {
            self.navigationItem.leftBarButtonItem = nil
        }
    }
}
