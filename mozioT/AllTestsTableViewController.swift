//
//  AllTestsTableViewController.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 01/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit

class AllTestsTableViewController: TableViewController {
    
    let cellIdentifier = "AllTest"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isPaginationEnabled = false
        self.shouldAddRefreshControl = false
        self.tableView.separatorStyle = .SingleLine
        self.title = "Choose Medical Test"
    }
    
    override func startLoadingData() {
        super.startLoadingData()
        
        let req = TestRequest(options: RequestType.ALL_TESTS)
        APIManager.sendAPIRequest(req) { (response) in
            let tests = response.parsedObject["data"] as! Array<AnyObject>
            var temp = Array<MedTest>()
            for dict in tests {
                let test = MedTest(dict: dict as! Dictionary<String, AnyObject>)
                temp.append(test)
            }
            self.tableArray = temp
            self.reloadTableData()
        }
        
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        
        if cell == nil {
            cell = UITableViewCell.init(style: .Subtitle, reuseIdentifier: cellIdentifier)
        }
        
        let object = self.tableArray[indexPath.row] as! MedTest
        cell?.textLabel?.text = object.title
        
        return cell!
    }
}
