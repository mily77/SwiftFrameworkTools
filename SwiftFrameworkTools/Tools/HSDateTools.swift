//
//  HSDateTools.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/8.
//  Copyright © 2018年 emily. All rights reserved.
//

import Foundation

//MARK: -时间戳转时间函数
func timeStampToString(timeStamp: Double, outputFormatter: String)->String {
    //时间戳为毫秒级要 ／ 1000， 秒就不用除1000，参数带没带000
    let timeString = String.init(format: "%d", timeStamp)
    
    let timeSta:TimeInterval
    
    if timeString.count == 10 {
        timeSta = TimeInterval(timeStamp)
    }else{
        timeSta = TimeInterval(timeStamp / 1000)
    }

    let date = NSDate(timeIntervalSince1970: timeSta)
    let dfmatter = DateFormatter()
    //yyyy-MM-dd HH:mm:ss
    dfmatter.dateFormat = outputFormatter
    return dfmatter.string(from: date as Date)
}

//MARK: -时间转时间戳函数
func timeToTimeStamp(time: String ,inputFormatter:String) -> Double {
    let dfmatter = DateFormatter()
    //yyyy-MM-dd HH:mm:ss 
    dfmatter.dateFormat = inputFormatter
    let last = dfmatter.date(from: time)
    let timeStamp = last?.timeIntervalSince1970
    return timeStamp!
}


