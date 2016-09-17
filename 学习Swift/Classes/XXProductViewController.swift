//
//  XXProductViewController.swift
//  学习Swift
//
//  Created by ZJ1620 on 16/9/7.
//  Copyright © 2016年 Globalegrow. All rights reserved.
//

import UIKit

let collectionCellId = "XXProductCollectionViewCell"


class XXProductViewController: XXBaseViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var collectionView : UICollectionView?
    var dataArray = [XXProductItem]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        XXNetWorkTool.sharenetworkTool.loadProductData { (resultObject) in
            self.dataArray = resultObject
            self.collectionView?.reloadData()
        }
    }

    func setupCollectionView() {

        self.collectionView = UICollectionView(frame: CGRectZero, collectionViewLayout: UICollectionViewFlowLayout())
        self.collectionView!.backgroundColor = UIColor.grayColor()
        self.collectionView!.delegate = self
        self.collectionView!.dataSource = self
        self.collectionView!.registerClass(XXProductCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: collectionCellId)
        view.addSubview(collectionView!)
        self.collectionView!.snp_makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsetsMake(0, 0, 0, 0))
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let productCell = collectionView.dequeueReusableCellWithReuseIdentifier(collectionCellId, forIndexPath: indexPath) as? XXProductCollectionViewCell
        let item = dataArray[indexPath.row]
        productCell?.setProductCell(item)
        
        return productCell!
        
    }
    

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSizeMake(SCREENW/2 - 10, 245)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(5, 5, 5, 5)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
