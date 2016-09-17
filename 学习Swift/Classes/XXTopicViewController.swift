//
//  XXTopicViewController.swift
//  学习Swift
//
//  Created by ZJ1620 on 16/9/12.
//  Copyright © 2016年 Globalegrow. All rights reserved.
//

import UIKit

let itemCell = "homeItemCell"


class XXTopicViewController: XXBaseViewController,UITableViewDelegate,UITableViewDataSource,XXHomeCellDelegate {

    var type = Int()
    let tableView = UITableView()
    var dataArray = [XXHomeItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    
        XXNetWorkTool.sharenetworkTool.loadHomeData(type) { (resultObject) in
            self.dataArray = resultObject
            self.tableView.reloadData()
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    func setTableView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160
        tableView.separatorStyle = .None
        tableView.delegate = self
        tableView.dataSource = self
        tableView.scrollIndicatorInsets = tableView.contentInset
        tableView.registerClass(XXHomeCell.classForCoder(), forCellReuseIdentifier: itemCell)
        view.addSubview(tableView)
        tableView.snp_makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(108)
            make.bottom.equalTo(-49)
        }
        
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return dataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var homeCell = tableView.dequeueReusableCellWithIdentifier(itemCell) as? XXHomeCell
        if (homeCell == nil) {
            homeCell = XXHomeCell(style: UITableViewCellStyle.Default, reuseIdentifier: itemCell)
        }
        homeCell?.selectionStyle = .None
        let item: XXHomeItem = dataArray[indexPath.row]
        
        homeCell?.setHomeCell(item)
        homeCell?.delegate = self
        return homeCell!
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    func homeCellDidClickFavoriteButton(button: UIButton) {
        print("点击收藏按钮")
    }
    
}
