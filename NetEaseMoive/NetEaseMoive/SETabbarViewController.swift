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
            movieVC.tabBarItem = settingTabbarItem("tab_movie", highlightImageName: "tab_movie_highlight")
        let movieNav = SENavViewController(rootViewController: movieVC)
    
        //剧场
        let cinemaVC = CinemaViewController()
            cinemaVC.tabBarItem = settingTabbarItem("tab_cinema", highlightImageName: "tab_cinema_highlight")
        let cinemaNav = SENavViewController(rootViewController: cinemaVC)
        
        //发现
        let discoveryVC = DiscoveryViewController()
            discoveryVC.tabBarItem = settingTabbarItem("tab_discovery", highlightImageName: "tab_discovery_highlight")
        let discoveryNav = SENavViewController(rootViewController: discoveryVC)
        
        //设置
        let settingVC = SettingViewController()
            settingVC.tabBarItem = settingTabbarItem("tab_account", highlightImageName: "tab_account_highlight")
        let settingNav = SENavViewController(rootViewController: settingVC)
    
        self.viewControllers = [movieNav,cinemaNav,discoveryNav,settingNav]
    }

    
    func settingTabbarItem(normalImageName:String,highlightImageName:String) -> UITabBarItem {
    
        let item :UITabBarItem = UITabBarItem(title:nil, image:UIImage(named: normalImageName)?.imageWithRenderingMode(.AlwaysOriginal), selectedImage :UIImage(named: highlightImageName)?.imageWithRenderingMode(.AlwaysOriginal))
        item.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0)
        return item
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
