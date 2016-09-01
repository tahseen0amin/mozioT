//
//  TableViewController.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 01/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import UIKit

class TableViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    var refreshControl : UIRefreshControl?
    var indicatorView : UIActivityIndicatorView?
    var shouldAddRefreshControl = true
    var isPaginationEnabled = true
    var isLoading = false
    
    var tableArray: Array<AnyObject> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.commonInit()
        self.startLoadingData()
        self.view.backgroundColor = UIColor.groupTableViewBackgroundColor()
        self.setupNavigation()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
    }
    
    func commonInit() {
        if self.tableView == nil {
            self.tableView = UITableView.init()
            var insets = UIEdgeInsetsZero
            if (self.navigationController != nil) {
                insets.bottom = 64
            }
            self.view.addSubViewWithConstraint(self.tableView, inset: insets)
        }
        
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 100
        self.tableView.tableFooterView = UIView.init()
        self.tableView.separatorStyle = .None
        self.tableView.backgroundColor = UIColor.clearColor()
        
    }
    
    func addControls() {
        if self.tableArray.count > 0 {
            if shouldAddRefreshControl && refreshControl == nil {
                refreshControl = UIRefreshControl.init()
                refreshControl?.backgroundColor = UIColor.clearColor()
                refreshControl?.tintColor = color_main
                refreshControl?.addTarget(self, action: #selector(tablePulled), forControlEvents: .ValueChanged)
                self.tableView.addSubview(refreshControl!)
            }
            if isPaginationEnabled && indicatorView == nil {
                let viewBottom = UIView.init(frame: CGRectMake(0, 0, tableView.bounds.size.width, 40))
                indicatorView = UIActivityIndicatorView.init(activityIndicatorStyle: .Gray)
                viewBottom.addSubview(indicatorView!)
                viewBottom.backgroundColor = UIColor.clearColor()
                indicatorView?.center = viewBottom.center
                indicatorView?.hidesWhenStopped = true
                self.tableView.tableFooterView = viewBottom
            }
        }
    }
    
    func tablePulled() {
        self.startLoadingData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func startLoadingData() {
        self.isLoading = true
        if self.tableArray.count > 0 {
            self.indicatorView?.startAnimating()
        }
        else {
            self.indicatorView?.stopAnimating()
        }
    }
    
    //MARK: Showing No Data Message
    func reloadTableData() {
        dispatch_async(dispatch_get_main_queue()) {
            self.addControls()
            self.tableView.reloadData()
            self.isLoading = false
            
            if self.refreshControl != nil {
                self.refreshControl?.endRefreshing()
            }
            
            if self.tableArray.count > 0 || self.isLoading {
                self.indicatorView?.stopAnimating()
            }
        }
    }
    
    //MARK: Tableview Delegate
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        assert(false, "Need to implement cell for 'cellForRowAtIndexpath'")
        return UITableViewCell.init()
    }
    
    
    //MARK: pagination
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if self.tableArray.count > 0 && self.isLoading == false && ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height-20) {
            self.startLoadingData()
        }
    }
    
}
