//
//  XXNetWorkTool.swift
//  学习Swift
//
//  Created by ZJ1620 on 16/9/8.
//  Copyright © 2016年 Globalegrow. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


let BaseUrl = "http://api.dantangapp.com/";

class XXNetWorkTool: NSObject {

    static let sharenetworkTool = XXNetWorkTool()
    
    /**
     *首页数据
     *
     */
    func loadHomeData(id:Int,finish:(resultObject:[XXHomeItem]) -> Void) -> Void {
        let url = BaseUrl + "v1/channels/\(id)/items"
        let params = ["gender": 1,
                      "generation": 1,
                      "limit": 20,
                      "offset": 0]
        
        Alamofire.request(.GET, url, parameters: params).validate().responseJSON { (response) in
            
            if response.result.isSuccess
            {
                if let value = response.result.value {
                    
                    let dict = JSON(value)
                    
                    let data = dict["data"].dictionary
                    
                    if let items = data!["items"]?.arrayObject{
                        var homeItem = [XXHomeItem]()
                        for item in items{
                            let arr = XXHomeItem(dict: item as! [String:AnyObject])
                            homeItem.append(arr)
                        }
                        finish(resultObject: homeItem)
                    }
                    
                }
            }
            
        }
    }
    
    
    /**
     *顶部选择器
     *
     */
    func loadTopData(finish:(resultObject:[XXChannel]) -> Void) -> Void {
        let url = BaseUrl + "v2/channels/preset"
        let params = ["gender": 1,"generation": 1]
        Alamofire.request(.GET, url, parameters: params).validate().responseJSON { (response) in
            
            if response.result.isSuccess
            {
                if let value = response.result.value {
                    
                    let dict = JSON(value)
                    
                    let data = dict["data"].dictionary
                    
                    if let channels = data!["channels"]?.arrayObject{
                        var xx_channel = [XXChannel]()
                        for channel in channels{
                            let arr = XXChannel(dict: channel as! [String:AnyObject])
                            xx_channel.append(arr)
                        }
                        finish(resultObject: xx_channel)
                    }
                
                }
            }
            
        }
        
    }
    
    
    /**
     *单品数据
     *
     */
    func loadProductData(finish:(resultObject:[XXProductItem])->Void) {
        let url = BaseUrl + "v2/items"
        let params = ["gender": 1,"generation": 1,"limit": 20,"offset": 0]
        Alamofire.request(.GET, url, parameters: params).validate().responseJSON { (response) in
            
            if response.result.isSuccess
            {
                if let value = response.result.value {
                    
                    let dict = JSON(value)
                    
                    let data = dict["data"].dictionary
                    
                    if let items = data!["items"]?.arrayObject{
                        var xx_items = [XXProductItem]()
                        for item in items{
                            let dataArr = item["data"]
                            let arr = XXProductItem(dict: dataArr as! [String:AnyObject])
                            xx_items.append(arr)
                        }
                        finish(resultObject: xx_items)
                    }
                    
                }
            }
        }
    }
    
}
