//
//  SEMoiveParentViewController.swift
//  NetEaseMoive
//
//  Created by ftxbird on 15/11/29.
//  Copyright © 2015年 swiftMe. All rights reserved.
//

import UIKit

class SEMoiveParentViewController: UIViewController {

    let normalMovieVC = MovieViewController()
    let swipeMovieVC = SESwipeMovieViewController()
    var isChangeSwipe :Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        self.addChildViewController(normalMovieVC)
        self.view.addSubview(normalMovieVC.view)
        self.addChildViewController(swipeMovieVC)
        
        //设置导航栏  *_* 有空自己写个哈
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
        //设置中间titleView
        let runkeeperSwitch = DGRunkeeperSwitch(leftTitle: "热映", rightTitle: "预告")
        runkeeperSwitch.backgroundColor = UIColor(red: 239.0/255.0, green: 95.0/255.0, blue: 49.0/255.0, alpha: 1.0)
        runkeeperSwitch.selectedBackgroundColor = .whiteColor()
        runkeeperSwitch.titleColor = .whiteColor()
        runkeeperSwitch.selectedTitleColor = SEUIConfigCenter.sharedCenter.appColor
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
        
        navigationItem.rightBarButtonItems = [searchItem,switchScrollMoiveItem]
        
        // Do any additional setup after loading the view.
    }

    
    
    func  userTapLocAction() {
        
        print("-------Loc")
        [swipeMovieVC.willMoveToParentViewController(self)];
        
        if(isChangeSwipe == false) {
            isChangeSwipe = true
            self.transitionFromViewController(normalMovieVC, toViewController: swipeMovieVC, duration: 1.0, options:.TransitionFlipFromLeft, animations:{
                
                },completion: nil)
        }else {
            isChangeSwipe = false
            self.transitionFromViewController(swipeMovieVC, toViewController: normalMovieVC, duration: 1.0, options:.TransitionFlipFromLeft, animations:{
                
                },completion:nil)
        
        }
        
       
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
