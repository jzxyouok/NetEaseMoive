//
//  SEMoiveModel.swift
//  NetEaseMoive
//
//  Created by ftxbird on 15/11/28.
//  Copyright © 2015年 swiftMe. All rights reserved.
//
//

import UIKit
import ObjectMapper

class SEMoiveModel: Mappable {

    //电影Id
    var movieId : String?

    //电影标题
    var name : String?
    
    //是否芯片
    var isNew : String?
    
    //电影简要
    var highlight : String?
    
    //电影评分
    var grade : String?
    
    //电影Logo
    var logoUrl : String?
    
    //电影类型标签
    var dimensional : String?
    
    //电影发行日期
    var releaseDate : String?
    
    //电影片长
    var duration : String?
    
    //影院播放场次  eg:"今天120家影院放映1405场"
    var screening : String?
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        movieId         <- map["id"]
        name            <- map["name"]
        isNew           <- map["isnew"]
        highlight       <- map["highlight"]
        grade           <- map["grade"]
        logoUrl         <- map["logo520692"]
        dimensional     <- map["dimensional"]
        releaseDate     <- map["releasedate"]
        duration        <- map["duration"]
        screening       <- map["screenings"]
    }
}


class SEMoiveList: Mappable {
    var movies: [SEMoiveModel]?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        movies <- map["list"]
    }
}
