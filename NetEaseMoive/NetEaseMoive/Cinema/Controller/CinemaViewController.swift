//
//  CinemaViewController.swift
//  NetEaseMoive
//
//  Created by ftxbird on 15/11/28.
//  Copyright © 2015年 swiftMe. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class CinemaViewController: UITableViewController {
    
    var CinemaModels:[SECinemaModel]? = [] {
        didSet{
            //刷新表格数据
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.registerNib(UINib.init(nibName: "SECinemaCell", bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "cinemalCell")
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension
        
        let url = "http://piao.163.com/m/cinema/list.html?app_id=2&mobileType=iPhone&ver=3.7.1&channel=lede&deviceId=694045B8-1E5F-4237-BE59-929C5A5922A2&apiVer=21&city=110000"
       
        
        Alamofire.request(.GET, url).responseObject { (response: Response<SECinemaList, NSError>) in
            
            let cinemalList = response.result.value
            
            
            if let list : [SECinemaModel] = cinemalList?.Cinemas {
                
                self.CinemaModels = list
                
            
            }
            
//            let movieList = response.result.value
//            
//            if let list : [SEMoiveModel] = movieList?.movies {
//                
//                self.movies = list
//                self.tableView.reloadData()
//            }

           
           
            
            //    if let list : [SEMoiveModel] = movieList?.movies {
            //
            //    self.movies = list
            //    self.tableView.reloadData()
            //    }
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    
    override func  tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (CinemaModels?.count)!
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cinemalCell") as! SECinemaCell
        
        cell.SECinemalM = self.CinemaModels![indexPath.row];
    
        return cell
        
    }
    
    
    //请求数据http://piao.163.com/m/cinema/list.html?app_id=2&mobileType=iPhone&ver=3.7.1&channel=lede&deviceId=694045B8-1E5F-4237-BE59-929C5A5922A2&apiVer=21&city=110000
    
    
    
    
   
}



