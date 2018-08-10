//
//  Macro.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/2/28.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit


// MARK:- 屏幕大小宽高
//    定义2个常用的常量
let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
func kScreenBounds() -> CGRect {
    return UIScreen.main.bounds
}
func kScreenSize() -> CGSize {
    return kScreenBounds().size
}
func kScreenWidth() -> CGFloat {
    return kScreenSize().width
}
func kScreenHeight() -> CGFloat {
    return kScreenSize().height
}

// MARK:- 颜色方法
// MARK:- 十六进制
func kRGBColorFromHex(rgbValue: Int) -> UIColor {
    return UIColor(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16)) / 255.0,
                   green: ((CGFloat)((rgbValue & 0xFF00) >> 8)) / 255.0,
                   blue: ((CGFloat)(rgbValue & 0xFF)) / 255.0,
                   alpha: 1.0)
}
// MARK:- 带透明度
func kRGBAColor(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
// MARK:- 不带透明度
func kRGBColor(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}
