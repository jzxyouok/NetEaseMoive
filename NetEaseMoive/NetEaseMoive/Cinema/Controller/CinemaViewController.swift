//
//  CinemaViewController.swift
//  NetEaseMoive
//
//  Created by ftxbird on 15/11/28.
//  Copyright © 2015年 swiftMe. All rights reserved.
//

import UIKit

class CinemaViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //这侧 cell
        

        tableView.registerNib(UINib.init(nibName: "SECinemaCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "cinemalCell")
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func  tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cinemalCell")
        
        return cell!
        
    }
   
}



