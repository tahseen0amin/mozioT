//
//  MedicalTestResultController.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 02/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit

class MedicalTestResultController: BaseViewController {
    
    var currentTest : CurrentMedTest!
    
    @IBOutlet weak var lblTestName: UILabel!
    @IBOutlet weak var lblTestResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Results"
        self.setupNavigation()
        // Do any additional setup after loading the view.
        if self.currentTest != nil {
            self.lblTestName.text = self.currentTest.title
            for res in self.currentTest.results {
                if self.currentTest.totalValue == res.value {
                    self.lblTestResults.text = res.body
                    return
                }
            }
            self.lblTestResults.text = "Not likely to have this disorder"
            
        } else {
            self.lblTestName.text = ""
            self.lblTestResults.text = ""
        }
        
    }
    
    override func setupNavigation() {
        let fixedItem = UIBarButtonItem(barButtonSystemItem: .FixedSpace, target: nil, action: nil)
        fixedItem.width = 0;
        let backButton = UIButton(type: .Custom)
        backButton.setImage(UIImage(named: "back_btn"), forState: .Normal)
        backButton.addTarget(self.navigationController, action: #selector(UINavigationController.popToRootViewControllerAnimated(_:)), forControlEvents: .TouchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: 30, height: 25)
        let backBarButton = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButton
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
