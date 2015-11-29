//
//  SETabbarViewController.swift
//  NetEaseMoive
//
//  Created by ftxbird on 15/11/28.
//  Copyright © 2015年 swiftMe. All rights reserved.
//

import UIKit

class SETabbarViewController: UITabBarController,UITabBarControllerDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 0
        
        //电影
        let movieVC = MovieViewController()
        movieVC.title = "电影"
//      movieVC.tabBarItem = UITabBarItem(title:"电影", image: nil, selectedImage: nil)
        let movieNav = SENavViewController(rootViewController: movieVC)
    
        //剧场
        let cinemaVC = CinemaViewController()
        cinemaVC.title = "剧场"
//      cinemaVC.tabBarItem = UITabBarItem(title:"剧场", image: nil,   selectedImage: nil)
        let cinemaNav = SENavViewController(rootViewController: cinemaVC)
        
        //发现
        let discoveryVC = DiscoveryViewController()
        discoveryVC.title = "发现"
//            discoveryVC.tabBarItem = UITabBarItem(title:"发现", image: nil, selectedImage: nil)
        let discoveryNav = SENavViewController(rootViewController: discoveryVC)
        
        //设置
        let settingVC = SettingViewController()
        settingVC.title = "我的"
//            settingVC.tabBarItem = UITabBarItem(title:"我的", image: nil, selectedImage: nil)
        let settingNav = SENavViewController(rootViewController: settingVC)
    
         self.viewControllers = [movieNav,cinemaNav,discoveryNav,settingNav]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
