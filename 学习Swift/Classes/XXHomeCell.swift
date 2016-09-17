//
//  XXHomeCell.swift
//  学习Swift
//
//  Created by ZJ1620 on 16/9/12.
//  Copyright © 2016年 Globalegrow. All rights reserved.
//

import UIKit
import SnapKit
import Kingfisher

protocol XXHomeCellDelegate: NSObjectProtocol {
    func homeCellDidClickFavoriteButton(button:UIButton)
}

class XXHomeCell: UITableViewCell {

    var delegate: XXHomeCellDelegate?
    
    let logoImage = UIImageView()
    let nameLabel = UILabel()
    let favoriteBut = UIButton()
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "homeItemCell")
        self.backgroundColor = UIColor.whiteColor()
        setupSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
     fatalError("has not been implemented")
    }
    
    
    func setupSubView() {
        logoImage.contentMode = UIViewContentMode.ScaleAspectFill
        logoImage.layer.cornerRadius = 8
        logoImage.layer.masksToBounds = true
        self.addSubview(logoImage)
        logoImage.snp_makeConstraints { (make) in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(10)
            make.bottom.equalTo(-10)
        }
        
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.font = UIFont.systemFontOfSize(14)
        nameLabel.textAlignment = NSTextAlignment.Left
        self.addSubview(nameLabel)
        nameLabel.snp_makeConstraints { (make) in
            make.left.equalTo(logoImage.snp_left).offset(5)
            make.bottom.equalTo(logoImage.snp_bottom).offset(-5)
            make.right.equalTo(logoImage.snp_right).offset(-10)
        }
        
        favoriteBut.backgroundColor = UIColor.blackColor()
        favoriteBut.alpha = 0.5
        favoriteBut.layer.cornerRadius = 12.5
        favoriteBut.layer.masksToBounds = true
        favoriteBut.layer.shouldRasterize = true
        favoriteBut.layer.rasterizationScale = UIScreen.mainScreen().scale
        favoriteBut.setImage(UIImage(named: "Feed_FavoriteIcon_17x17_"), forState: .Normal)
        favoriteBut.addTarget(self, action: #selector(XXHomeCell.didFavoriteButton(_:)), forControlEvents: .TouchUpInside)
        self.addSubview(favoriteBut)
        favoriteBut.snp_makeConstraints { (make) in
            make.right.equalTo(logoImage.snp_right).offset(-10)
            make.top.equalTo(logoImage.snp_top).offset(10)
            make.height.equalTo(25)
        }
      
    }

    func setHomeCell(homeItem: XXHomeItem) {
        
        let url = homeItem.cover_image_url
        
        logoImage.kf_setImageWithURL(NSURL(string: url!)!, placeholderImage: nil, optionsInfo: nil, progressBlock: nil) { (image, error, cacheType, imageURL) in
        }
        
        nameLabel.text = homeItem.title!
        
        favoriteBut.setTitle(" " + String(homeItem.likes_count!) + " ", forState: .Normal)
     
    }

    func didFavoriteButton(senter:UIButton) {
        delegate?.homeCellDidClickFavoriteButton(senter)
    }

}
