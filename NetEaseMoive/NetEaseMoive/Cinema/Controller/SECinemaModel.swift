//
//  SECinemaModel.swift
//  NetEaseMoive
//
//  Created by 李永方 on 15/11/29.
//  Copyright © 2015年 swiftMe. All rights reserved.
//

import UIKit
import ObjectMapper


class SECinemaModel:Mappable{
    
    /// 标题名
    var districtId: Int = 0
    /// 影院名称
    var name : String?
    /// 影院地址
    var address : String?
    /// 播放银屏
    var screenings :String?
    /// 最低价格
    var lowPrice: String?
    /// 是否有座
    var isSeatSupport: String?
    /// 是否有票
    var isCouponSupport:String?
    
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
       districtId        <- map["districtId"]
        name             <- map["name"]
        address          <- map["address"]
        lowPrice         <- map["lowPrice"]
        screenings       <- map["screenings"]
        isSeatSupport    <- map["isSeatSupport"]
        isCouponSupport  <- map["isCouponSupport"]
        
    }
}
    
    
    class SECinemaList: Mappable {
        var Cinemas: [SECinemaModel]?
        
        required init?(_ map: Map){
            
        }
        
        func mapping(map: Map) {
            Cinemas <- map["cinemaList"]
        }
    }


    
    
//    /// 字典转模型
//    
//    init(dict: [String: AnyObject]) {
//        
//        super.init()
//        
//        setValuesForKeysWithDictionary(dict)
//
//    }
//    
//    override func setValue(value: AnyObject?, forUndefinedKey key: String) {}
//    
//}




