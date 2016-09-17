//
//  XXTabBarController.swift
//  学习Swift
//
//  Created by ZJ1620 on 16/9/7.
//  Copyright © 2016年 Globalegrow. All rights reserved.
//

import UIKit

class XXTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = XXColor(245, g: 80, b: 83, a: 1.0)
        self.addChildControllers();
    }

    /**
     *添加子控制器
     *
     */
    func addChildControllers() {
        self.addChildViewController(XXDanTangViewController(), title: "单糖", imageName: "TabBar_home_23x23_")
        self.addChildViewController(XXProductViewController(), title: "单品", imageName: "TabBar_gift_23x23_")
        self.addChildViewController(XXCategoryViewController(), title: "分类", imageName: "TabBar_category_23x23_")
        self.addChildViewController(XXMeViewController(), title: "我", imageName: "TabBar_me_boy_23x23_")
    }
    
    /**
     *初始化自控制器
     *
     */
    func addChildViewController(viewController : UIViewController, title : String, imageName: String){
        viewController.tabBarItem.image = UIImage(named: imageName)
        viewController.tabBarItem.selectedImage = UIImage(named: imageName + "selected")
        viewController.title = title
        let navi = XXNavigationController()
        
        navi.addChildViewController(viewController)
        addChildViewController(navi)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
