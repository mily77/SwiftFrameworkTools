//
//  ValidationService.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/5/31.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class ValidationService {
    //单例类
    static let instance = ValidationService()
    private init(){}
    
    let minCount = 6
    
    func validationUserName(_ name:String) -> Observable<Result> {
        if name.count == 0 {
            return Observable.just(Result.empty)
        }
        if name.count < minCount {
            return Observable.just(Result.failed(message: "用户名长度至少为6位"))
        }
        return Observable.just(Result.ok(message: "用户名可用"))
    }
    
    func validationPassword(_ password:String) -> Observable<Result> {
        if password.count == 0 {
            return .just(.empty)
        }
        if  password.count < minCount {
            return Observable.just(Result.failed(message: "密码长度至少为6位"))
        }
        return Observable.just(Result.ok(message: "密码可用"))
    }
    
    func login(_ userName:String,password:String) -> Observable<Result> {
        if userName.count > 0 && password.count > 0 {
            return Observable.just(Result.ok(message: "登录成功"))
        }
        return Observable.just(Result.failed(message: "账号或密码错误"))
    }
    
}
