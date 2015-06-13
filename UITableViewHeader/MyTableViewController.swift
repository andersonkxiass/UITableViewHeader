//
//  TableViewController.swift
//  UITableViewHeader
//
//  Created by Anderson Caxias on 13/06/15.
//  Copyright (c) 2015 Anderson Caxias. All rights reserved.
//

import UIKit

class MyTableViewController: UITableViewController, UIScrollViewDelegate {
    
    var headerView = UIView()
    
    var parallaxFactor:CGFloat = 2
    
    var imageHeight:CGFloat = 205 {
        didSet {
            moveImage()
        }
    }
    
    var scrollOffset:CGFloat = 0 {
        didSet {
            moveImage()
        }
    }
    
    func moveImage() {
        let imageOffset = (scrollOffset >= 0) ? scrollOffset / parallaxFactor : 0
        let imageHeight = (scrollOffset >= 0) ? self.imageHeight : self.imageHeight - scrollOffset
        headerView.frame = CGRect(x: 0, y: -imageHeight + imageOffset, width: view.bounds.width, height: imageHeight)
    }
    
    var backView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView = loadNib()
        
        backView.frame = CGRect(x: 0, y: 0 , width: view.bounds.width, height: view.bounds.height)
        backView.backgroundColor = tableView.backgroundColor
        
        view.addSubview(backView)
        view.sendSubviewToBack(backView)
        
        // Set the contentInset to make room for the image.
        tableView.contentInset = UIEdgeInsets(top: imageHeight, left: 0, bottom: 0, right: 0)
        
        // Add the imageView to the TableView and send it to the back.
        view.addSubview(headerView)
        view.sendSubviewToBack(headerView)
        
        tableView.estimatedRowHeight = 60
        tableView.rowHeight = UITableViewAutomaticDimension
    }
    
    private func loadNib() -> UIView {
        let bundle = NSBundle(forClass: self.dynamicType)
        return bundle.loadNibNamed("HeaderView", owner: nil, options: nil)[0] as! UIView
    }
    
    override func viewDidLayoutSubviews() {
        // Update the image position after layout changes.
        moveImage()
    }
    
    // Update scrollOffset on tableview scroll
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        scrollOffset = tableView.contentOffset.y + imageHeight
    }
    
    override func viewDidAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.layoutIfNeeded()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 840
    }
    
    override func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:TableViewCell? = tableView.dequeueReusableCellWithIdentifier("Cell") as?  TableViewCell
        
        if(cell == nil){
            
            cell = TableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        }
        
        cell?.dataArr = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "L", "M"]
        
        cell!.layer.masksToBounds = true
        cell!.layer.cornerRadius = 3.0
        cell!.clipsToBounds = true;
        cell!.backgroundColor = UIColor.clearColor()
        cell!.layer.shadowColor = UIColor.lightGrayColor().CGColor
        cell!.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cell!.layer.shadowOpacity = 1.0
        cell!.layer.shadowRadius = 2
        cell!.layer.masksToBounds = true
        cell!.clipsToBounds = false
        
        return cell!

    }
}