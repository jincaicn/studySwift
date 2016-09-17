//
//  XXProductCollectionViewCell.swift
//  学习Swift
//
//  Created by ZJ1620 on 16/9/13.
//  Copyright © 2016年 Globalegrow. All rights reserved.
//

import UIKit

class XXProductCollectionViewCell: UICollectionViewCell {
 
    let logoImage = UIImageView()
    let name = UILabel()
    let price = UILabel()
    let favitor = UIButton()

   override init(frame: CGRect) {
    
    super.init(frame: frame)
    self.backgroundColor = UIColor.whiteColor()
    setupCollectionViewCell()
    
    }
    
   required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
    func setupCollectionViewCell() {
        logoImage.backgroundColor = UIColor.redColor()
        logoImage.contentMode = .ScaleAspectFill
        logoImage.layer.masksToBounds = true
        self.addSubview(logoImage)
        logoImage.snp_makeConstraints { (make) in
            make.top.left.right.equalTo(0)
            make.height.equalTo(SCREENW/2 - 10)
        }
        
        name.textAlignment = .Left
        name.font = UIFont.systemFontOfSize(14)
//        name.textColor = 
        name.numberOfLines = 0
        name.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.addSubview(name)
        name.snp_makeConstraints { (make) in
            make.top.equalTo(logoImage.snp_bottom).offset(10)
            make.right.left.equalTo(0)
        }
        
        price.textAlignment = .Left
        price.font = UIFont.systemFontOfSize(14)
        price.textColor = UIColor.redColor()
        self.addSubview(price)
        price.snp_makeConstraints { (make) in
            make.bottom.equalTo(self.snp_bottom).offset(-5)
            make.left.equalTo(0)
        }
        
        favitor.setTitleColor(UIColor.grayColor(), forState: .Normal)
        favitor.backgroundColor = UIColor.clearColor()
        favitor.setImage(UIImage(named: "Search_GiftBtn_Default_12x10_"), forState: .Normal)
        favitor.addTarget(self, action: #selector(didFavoriteButton(_:)), forControlEvents: .TouchUpInside)
        self.addSubview(favitor)
        
        favitor.snp_makeConstraints { (make) in
            make.right.equalTo(logoImage.snp_right).offset(-10)
            make.top.equalTo(price.snp_top)
//            make.height.equalTo(25)
        }
        
    }
    
    func setProductCell(productItem:XXProductItem) {
        let url = productItem.cover_image_url!
        logoImage.kf_setImageWithURL(NSURL(string: url)!, placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
            
        }
        favitor.setTitle(" " + String(productItem.favorites_count!) + " ", forState: .Normal)
        name.text = productItem.name
        price.text = "￥" + String(productItem.price!)
    }
    
    
    func didFavoriteButton(senter:UIButton) {
//        delegate?.homeCellDidClickFavoriteButton(senter)
    }
}
