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
    
    //是否销售中
    var isSale :String?
    
    
    enum SEMovieType: String {
        case SEMovieType2D       = "2D"
        case SEMovieType2DIMax   = "2D,IMAX"
        case SEMovieType3D       = "3D"
        case SEMovieType3DIMax   = "3D,IMAX"
        case SEMovieType2D3DIMax = "2D,3D,IMAX"
    }
    
    required init?(_ map: Map) {
        
    }
    
    func mapping(map: Map) {
        movieId         <- map["id"]
        name            <- map["name"]
        isNew           <- map["isNew"]
        highlight       <- map["highlight"]
        grade           <- map["grade"]
        logoUrl         <- map["logo520692"]
        dimensional     <- map["dimensional"]
        releaseDate     <- map["releasedate"]
        duration        <- map["duration"]
        screening       <- map["screenings"]
        isSale          <- map["isSale"]
    }
    
    
    func markImageNameForMovieType() -> String? {
    
          if let movieMarkName = SEMovieType(rawValue: self.dimensional!) {
            
            switch movieMarkName {
            
            case .SEMovieType2D :
                return .None
            case .SEMovieType2DIMax :
                return "mark_iMax&2dBelt"
            case .SEMovieType3D :
                return "mark_3dBelt"
            case .SEMovieType3DIMax ,.SEMovieType2D3DIMax :
                return "mark_iMax&3dBelt"
            }
          } else {
            return .None
        }
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
