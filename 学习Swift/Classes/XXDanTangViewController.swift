//
//  XXDanTangViewController.swift
//  学习Swift
//
//  Created by ZJ1620 on 16/9/7.
//  Copyright © 2016年 Globalegrow. All rights reserved.
//

import UIKit

class XXDanTangViewController: XXBaseViewController ,UIScrollViewDelegate{

    var titlesView = UIView()//顶部标签view
    var indicatorView = UIView()//底部红色指示器
    var contentView = UIScrollView()//
    var selectedBut = UIButton()//选中的按钮

    override func viewDidLoad() {
        super.viewDidLoad()
        //设置搜索按钮
        setRightNavi()
     
        
       XXNetWorkTool.sharenetworkTool.loadTopData { (resultObject) in
        
        for channel in resultObject{
            let vc = XXTopicViewController()
            vc.title = channel.name!
            vc.type = channel.id!
            self.addChildViewController(vc)
        }
        //设置头部titles
        self.setupTitleView()
        //设置底部scrollview
        self.setupContentView()
        }
    }
    
    /**
     *设置顶部title标题
     *
     */
    func setupTitleView() {
        
        //头部背景View
        let bgView = UIView()
        bgView.frame = CGRectMake(0, 64, SCREENW, 44)
        view.addSubview(bgView)
        //标签
        let titlesView = UIView()
        titlesView.frame = CGRectMake(0, 0, SCREENW - 44, 44);
        titlesView.backgroundColor = XXGlobalColor()
        bgView.addSubview(titlesView)
        self.titlesView = titlesView
        //底部红色
        let indicatorView = UIView()
        indicatorView.backgroundColor = XXGlobalRedColor()
        indicatorView.y = 42
        indicatorView.height = 2
        self.indicatorView = indicatorView
        //选择按钮
        let arrowBut = UIButton()
        arrowBut.frame = CGRectMake(SCREENW - 44, 0, 44, 44)
        arrowBut.setImage(UIImage(named: "arrow_index_down_8x4_"), forState: UIControlState.Normal)
        arrowBut.addTarget(self, action: #selector(arrowButtonClick(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        arrowBut.backgroundColor = XXGlobalColor()
        bgView.addSubview(arrowBut)
        
        //内部子控件
        let count = childViewControllers.count
        let width = titlesView.width / CGFloat(count)
        let height = titlesView.height
       
        
        for index in 0..<count {
            let button = UIButton()
            button.frame = CGRectMake(CGFloat(index)*width, 0, width, height)
            button.tag = index
            let vc = childViewControllers[index]
            
            button.setTitle(vc.title, forState: UIControlState.Normal)
            button.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
            button.setTitleColor(XXGlobalRedColor(), forState: .Disabled)
            button.addTarget(self, action: #selector(titlesClick(_:)), forControlEvents: .TouchUpInside)
            titlesView.addSubview(button)
            
            if index == 0 {
                button.enabled = false
                selectedBut = button
                button.titleLabel?.sizeToFit()
                indicatorView.width = button.titleLabel!.width
                indicatorView.center.x = button.center.x
                
            }
            //添加底部指示器
            titlesView.addSubview(indicatorView)
        }
        
    }
    
    //标签上按钮点击
    func titlesClick(button: UIButton) {
        selectedBut.enabled = true
        button.enabled = false
        selectedBut = button
        
        UIView.animateWithDuration(0.25) {
            self.indicatorView.width = button.titleLabel!.width
            self.indicatorView.centerX = button.centerX
        }
    }
    
    //头部箭头方法
    func arrowButtonClick(button: UIButton) {
        UIView.animateWithDuration(0.25) { 
            button.imageView?.transform = CGAffineTransformRotate(button.imageView!.transform, CGFloat(M_PI))
        }
    }
    /**
     *设置底部View
     *
     */
    func setupContentView() {
        automaticallyAdjustsScrollViewInsets = false
        let contentView = UIScrollView()
        contentView.frame = view.bounds
        contentView.delegate = self
        contentView.contentSize = CGSizeMake(CGFloat(childViewControllers.count)*SCREENW, 0)
        contentView.pagingEnabled = true
        view.insertSubview(contentView, atIndex: 0)
        self.contentView = contentView
        scrollViewDidEndScrollingAnimation(contentView)
    }
    
    
    
    /**
     *设置右边搜索按钮
     *
     */
    func setRightNavi() {
        view.backgroundColor = UIColor.whiteColor()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "Feed_SearchBtn_18x18_"),style: .Plain, target: self, action: #selector(dantangRightBBClick))
    }
    
    func dantangRightBBClick() {
        let vc = XXSearchViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    /**
     *代理方法
     *
     */
    func scrollViewDidEndScrollingAnimation(scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        let vc = childViewControllers[index]
        vc.view.x = scrollView.contentOffset.x
        vc.view.y = 0
        vc.view.height = scrollView.height
        scrollView.addSubview(vc.view)
    }
    
 
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        scrollViewDidEndScrollingAnimation(scrollView)
        let index = Int(scrollView.contentOffset.x / scrollView.width)
        let button = titlesView.subviews[index] as! UIButton
        titlesClick(button)
        
        
    }
    
    
}
