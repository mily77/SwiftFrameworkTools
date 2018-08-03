//
//  LoginViewModel.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/5/31.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class LoginViewModel {
    //输出 这是输出的一个定义
    let userNameUsable:Driver<Result>
    let userPasswordAble:Driver<Result>
    var loginButtonEnabled :Driver<Bool>
    let loginResult:Driver<Result>
    
    init(input:(username:Driver<String>, password:Driver<String>, loginTaps:Driver<Void>), service:ValidationService) {
        //用户名是否合法
        userNameUsable = input.username.flatMapLatest({ username in
            return service.validationUserName(username).asDriver(onErrorJustReturn: Result.failed(message: "连接"))
            
        })
//        //密码是否合法
        userPasswordAble = input.password.flatMapLatest({ password in
            return service.validationPassword(password).asDriver(onErrorJustReturn: Result.failed(message: "密码错误"))
        })
        
        let userNameAndPassword = Driver.combineLatest(input.username,input.password){($0,$1)}
        //按钮点击的触发事件
        loginResult = input.loginTaps
            .withLatestFrom(userNameAndPassword)
            .flatMapLatest{ (arg) -> SharedSequence<DriverSharingStrategy, Result> in
                let (userName, password) = arg
                return service.login(userName, password: password).asDriver(onErrorJustReturn: .failed(message:"连接服务失败"))
        }
        //按钮是否可以点击
        loginButtonEnabled = input.password
            .map{$0.count > 6}
            .asDriver()
    }
}
