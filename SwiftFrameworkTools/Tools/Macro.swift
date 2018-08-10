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

// MARK: - 时间格式
enum TimeFormat:String
{
    case format_default            = "yyyy-MM-dd HH:mm:ss"
    case format_yyMdHm             = "yy-MM-dd HH:mm"
    case format_yyyyMdHm           = "yyyy-MM-dd HH:mm"
    case format_yMd                = "yyyy-MM-dd"
    case format_MdHms              = "MM-dd HH:mm:ss"
    case format_MdHm               = "MM-dd HH:mm"
    case format_Hms                = "HH:mm:ss"
    case format_Hm                 = "HH:mm"
    case format_Md                 = "MM-dd"
    case format_yyMd               = "yy-MM-dd"
    case format_YYMMdd             = "yyyyMMdd"
    case format_yyyyMdHms          = "yyyyMMddHHmmss"
    case format_yyyyMdHmsS         = "yyyy-MM-dd HH:mm:ss.SSS"
    case format_yyyyMMddHHmmssSSS  = "yyyyMMddHHmmssSSS"
    case format_yMdWithSlash       = "yyyy/MM/dd"
    case format_yM                 = "yyyy-MM"
    case format_yMdChangeSeparator = "yyyy.MM.dd"
}


