//
//  TableViewCell.swift
//  UITableViewHeader
//
//  Created by Anderson Caxias on 13/06/15.
//  Copyright (c) 2015 Anderson Caxias. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell, UITableViewDataSource,UITableViewDelegate {
    
    var dataArr:[String] = []
    
    var tableView:UITableView?
    
    let cellIdentifierTest:String = "CellTest"
    
    var headerView = UIView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        setUpTable()
        
        preservesSuperviewLayoutMargins = true
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpTable(){
        
        tableView = UITableView(frame: CGRectZero, style:UITableViewStyle.Plain)
        tableView!.delegate = self
        tableView!.dataSource = self
        
        //Disable scrollview from uitableview
        tableView!.scrollEnabled = false
        
        //Hide Empty rows
        var tblView =  UIView(frame: CGRectZero)
        tableView!.tableFooterView = tblView
        tableView!.tableFooterView!.hidden = true
        tableView!.backgroundColor = UIColor.clearColor()
        
        tableView!.separatorStyle = .None
        
        tableView!.registerNib(UINib(nibName: "LTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifierTest)
        
        self.addSubview(tableView!)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        tableView!.frame = CGRectMake(10, 10, self.bounds.size.width - 20, self.bounds.size.height)
        tableView!.layoutIfNeeded()
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        var cell:LTableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellIdentifierTest) as? LTableViewCell
        
        if(cell == nil) {
            cell = NSBundle.mainBundle().loadNibNamed("LTableViewCell", owner: self, options: nil)[0] as? LTableViewCell
        }
        
        cell!.selectionStyle = .None
        
        cell?.label.text = "\(indexPath.row) Test"
        
        return cell!
    }
    
    // Customize the section headings for each section
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
//    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        var headerView = UIView()
//        headerView = CGRectMake(0, 0, tableView.frame.size.width, 50.0)
//        headerView = UIColor.whiteColor()
//        return headerView
//    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
//    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        var sectionHeaderView = UIView()
//        sectionHeaderView.frame = CGRectMake(0, 0, tableView.frame.size.width, 50.0)
//        sectionHeaderView.backgroundColor = UIColor.whiteColor()
//        return sectionHeaderView
//    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50.0
    }
}