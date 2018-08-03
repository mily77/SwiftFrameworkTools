//
//  Music.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/13.
//  Copyright © 2018年 emily. All rights reserved.
//

import Foundation


struct Music {
    let name: String
    let singer: String
    
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
    
}
//实现 CustomStringConvertible 协议，方便输出调试
extension Music: CustomStringConvertible {
    var description: String {
        return "name:\(name) singer:\(singer)"
    }
    
}
