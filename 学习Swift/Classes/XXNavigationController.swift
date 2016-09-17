//
//  XXNavigationController.swift
//  学习Swift
//
//  Created by ZJ1620 on 16/9/7.
//  Copyright © 2016年 Globalegrow. All rights reserved.
//

import UIKit

class XXNavigationController: UINavigationController {

    /**
     *public。可以访问自己模块中的任何public实体。如果使用import语句引入其他模块，我们可以访问其他模块中的public实体。
     
     *internal。只能访问自己模块的任何internal实体，不能访问其他模块中的internal实体。internal可以省略，换句话说，默认访问限定是internal。
     
     *private。只能在当前源文件中使用的实体，称为私有实体。使用private修饰，可以用作隐藏某些功能的实现细节。
     *
     */
   internal override class func initialize() {
        super.initialize()
    let navBar = UINavigationBar.appearance()
    navBar.barTintColor = XXGlobalRedColor()
    navBar.tintColor = UIColor.whiteColor()
    navBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(),NSFontAttributeName: UIFont.systemFontOfSize(20)]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
