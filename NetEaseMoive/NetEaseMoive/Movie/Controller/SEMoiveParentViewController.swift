//
//  SEMoiveParentViewController.swift
//  NetEaseMoive
//
//  Created by ftxbird on 15/11/29.
//  Copyright © 2015年 swiftMe. All rights reserved.
//

import UIKit

class SEMoiveParentViewController: UIViewController, YSSegmentedControlDelegate {

    let normalMovieVC = MovieViewController()
    let swipeMovieVC = SESwipeMovieViewController()
    var isChangeSwipe :Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        self.view.backgroundColor = UIColor.whiteColor()
        self.addChildViewController(normalMovieVC)
        self.view.addSubview(normalMovieVC.view)
        self.addChildViewController(swipeMovieVC)
        
        self.navigationController?.view.backgroundColor = UIColor.whiteColor()
        
        //设置导航栏
        //设置中间titleView
        
        let segmented = YSSegmentedControl(
            frame: CGRect(
                x: 0,
                y: 0,
                width: 100,
                height: 44),
            titles: [
                "热映",
                "预告"
            ],
            action: {
                control, index in
                print ("segmented did pressed \(index)")
        })
        segmented.delegate = self
        navigationItem.titleView = segmented
    
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
            self.transitionFromViewController(swipeMovieVC, toViewController: normalMovieVC, duration: 1.0, options:.TransitionFlipFromRight, animations:{
                
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
