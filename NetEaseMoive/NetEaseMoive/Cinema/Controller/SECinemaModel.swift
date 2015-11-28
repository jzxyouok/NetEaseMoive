//
//  SECinemaModel.swift
//  NetEaseMoive
//
//  Created by 李永方 on 15/11/29.
//  Copyright © 2015年 swiftMe. All rights reserved.
//

import UIKit

class SECinemaModel: NSObject {
    
    /// 标题名
    var id: Int = 0
    /// 影院名称
    var name : String?
    /// 影院地址
    var address : String?
    /// 联系电话
    var tel : String?
    /// 播放银屏
    var screenings :String?
    /// 最低价格
    var lowPrice: String?
    
    
    /// 字典转模型
    
    init(dict: [String: AnyObject]) {
        
        super.init()
        
        setValuesForKeysWithDictionary(dict)

    }
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
    
}



