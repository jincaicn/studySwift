//
//  XXConst.swift
//  学习Swift
//
//  Created by ZJ1620 on 16/9/7.
//  Copyright © 2016年 Globalegrow. All rights reserved.
//

import UIKit

/// 屏幕的宽
let SCREENW = UIScreen.mainScreen().bounds.size.width
/// 屏幕的高
let SCREENH = UIScreen.mainScreen().bounds.size.height


/// RGBA的颜色设置
func XXColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

/// 背景灰色
func XXGlobalColor() -> UIColor {
    return XXColor(240, g: 240, b: 240, a: 1)
}
/// 红色
func XXGlobalRedColor() -> UIColor {
    return XXColor(245, g: 80, b: 83, a: 1.0)
}