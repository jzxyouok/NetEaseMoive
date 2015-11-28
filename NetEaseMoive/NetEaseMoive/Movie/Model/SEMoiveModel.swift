//
//  SEMoiveModel.swift
//  NetEaseMoive
//
//  Created by ftxbird on 15/11/28.
//  Copyright © 2015年 swiftMe. All rights reserved.
//
//http://piao.163.com/m/movie/list.html?app_id=2&mobileType=iPhone&ver=3.7.1&channel=lede&deviceId=694045B8-1E5F-4237-BE59-929C5A5922A2&apiVer=21&city=110000


import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper






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

//extension SEMoiveModel {
//
//    class func getModelArray() -> [SEMoiveModel] {
//    
//        let url = "http://piao.163.com/m/movie/list.html?app_id=2&mobileType=iPhone&ver=3.7.1&channel=lede&deviceId=694045B8-1E5F-4237-BE59-929C5A5922A2&apiVer=21&city=110000"
//        
//        Alamofire.request(.GET, url).responseObject { (response: Response<SEMoiveList, NSError>) in
//            
//            let movieList = response.result.value
//            
//            if let list : [SEMoiveModel] = movieList?.movies {
//              
//                
//            }
//        }
//        return
//    }
//
//}
// LKKNetWorkTool.request("v1/deal/get_single_deal", params: ["deal_id":deal.deal_id!]) { (data, error, request) -> Void in
//if let _ = error{
//    self.noticeError(errorMessage, autoClear: true, autoClearTime: autoClearTime)
//    return
//}
//do{
//    let info = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments)
//    let tmp = (info as! NSDictionary)["deals"]
//    if tmp == nil{
//        self.noticeError(errorMessage, autoClear: true, autoClearTime: autoClearTime)
//        return
//    }
//    let deals = LKKDeal.objectArrayWithKeyValuesArray(tmp as! NSArray) as! [LKKDeal]
//    let deal = deals.first
//    let isSelected = deal?.restrictions?.is_refundable?.integerValue == 1
//    self.refundableAnyTimeButton.selected = isSelected
//    self.refundableExpireButton.selected = isSelected
//}catch{
//    self.noticeError(errorMessage, autoClear: true, autoClearTime: autoClearTime)
//}
//}
//}



