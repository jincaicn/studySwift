//
//  XXChannel.swift
//  学习Swift
//
//  Created by ZJ1620 on 16/9/8.
//  Copyright © 2016年 Globalegrow. All rights reserved.
//

import UIKit

class XXChannel: NSObject {

    var editable: Bool?
    var id: Int?
    var name: String?
    
    init(dict: [String: AnyObject]) {
        id = dict["id"] as? Int
        name = dict["name"] as? String
        editable = dict["editable"] as? Bool
    }
    
}
