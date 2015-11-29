//
//  MovieViewController.swift
//  NetEaseMoive
//
//  Created by ftxbird on 15/11/28.
//  Copyright © 2015年 swiftMe. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class MovieViewController: UIViewController  {

    
    @IBOutlet weak var tableView: UITableView!
    

    var movies:[SEMoiveModel]? = [] {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        
        requestDataSource()
    }
    
    // MARK: -数据源获取
    
    func requestDataSource() {
        //待整理
        let url = "http://piao.163.com/m/movie/list.html?app_id=2&mobileType=iPhone&ver=3.7.1&channel=lede&deviceId=694045B8-1E5F-4237-BE59-929C5A5922A2&apiVer=21&city=110000"
        
        Alamofire.request(.GET, url).responseObject { (response: Response<SEMoiveList, NSError>) in
            
            let movieList = response.result.value
            
            if let list : [SEMoiveModel] = movieList?.movies {
                self.movies = list
            }
        }
    }
    
    // MARK: -UI设置 --后期加入UI配置中心
    
    func configUI() {
        
        //设置导航栏  *_* 有空自己写个哈
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        //设置中间titleView
        let runkeeperSwitch = DGRunkeeperSwitch(leftTitle: "热映", rightTitle: "预告")
        runkeeperSwitch.backgroundColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
        runkeeperSwitch.selectedBackgroundColor = .whiteColor()
        runkeeperSwitch.titleColor = .whiteColor()
        runkeeperSwitch.selectedTitleColor = SEUIConfigCenter.sharedCenter.appFontDefaultColor
        runkeeperSwitch.titleFont = UIFont(name: "HelveticaNeue-Medium", size: 13.0)
        runkeeperSwitch.frame = CGRect(x: 30.0, y: 40.0, width: 100.0, height: 30.0)
        runkeeperSwitch.addTarget(self, action: Selector("userTapLocAction"), forControlEvents: .ValueChanged)
        navigationItem.titleView = runkeeperSwitch
        
        
        //设置左边定位Item
        let locItem = UIBarButtonItem(title:"定位", style:.Plain, target: self, action:Selector("userTapLocAction"))
        navigationItem.leftBarButtonItem = locItem
        
        //设置右边两个Item
        let switchScrollMoiveItem = UIBarButtonItem(image:UIImage(named: "navi_pan"), style:.Plain, target: self, action: Selector("userTapLocAction"))
        let searchItem = UIBarButtonItem(image:UIImage(named: "navi_search"), style:.Plain, target: self, action: Selector("userTapLocAction"))
        
        navigationItem.rightBarButtonItems = [switchScrollMoiveItem,searchItem]
        
        //设置tableView
        tableView.backgroundColor = UIColor.whiteColor()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .None
        
        let nib: UINib = UINib(nibName: "SEMovieTableViewCell", bundle: NSBundle.mainBundle())
        tableView.registerNib(nib, forCellReuseIdentifier: "SEMovieTableViewCell")
    }
    
    
    func  userTapLocAction() {
    
     print("-------Loc")
    
    
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: -tableview delegate & datasource

extension MovieViewController :UITableViewDataSource,UITableViewDelegate {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return (movies?.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCellWithIdentifier("SEMovieTableViewCell") as? SEMovieTableViewCell
           cell!.configCellForModel((movies?[indexPath.row])!)
    
         return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }

    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
    }
}

