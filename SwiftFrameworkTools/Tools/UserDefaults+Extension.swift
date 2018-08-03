//
//  UserDefaults+Extension.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/1.
//  Copyright © 2018年 emily. All rights reserved.
//

import Foundation


extension UserDefaults {
    // 账户信息
    struct AccountInfo: UserDefaultsSettable {
        enum defaultKeys: String {
            case userInfo
        }
    }
    
    // 登录信息
    struct LoginInfo: UserDefaultsSettable {
        enum defaultKeys: String {
            case pickerLogined
            case deliverymanLogined
        }
    }

    struct CookiesInfo: UserDefaultsSettable {
        enum defaultKeys: String {
            case cookies
        }
    }

}

