//
//  MusicListViewModel.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/13.
//  Copyright © 2018年 emily. All rights reserved.
//

import Foundation
import RxSwift

//歌曲列表数据源
struct MusicListViewModel {
    let data = Observable.just([
        Music(name: "无条件", singer: "陈奕迅"),
        Music(name: "你曾是少年", singer: "S.H.E"),
        Music(name: "从前的我", singer: "陈洁仪"),
        Music(name: "在木星", singer: "朴树"),
        ])
}
