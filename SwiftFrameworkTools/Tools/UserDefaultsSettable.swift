//
//  UserDefaultsSettable.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/1.
//  Copyright © 2018年 emily. All rights reserved.
//

import Foundation

protocol UserDefaultsSettable {
    associatedtype defaultKeys: RawRepresentable
}

extension UserDefaultsSettable where defaultKeys.RawValue==String {
    static func set(value: Any?, forKey key: defaultKeys) {
        let aKey = key.rawValue
        UserDefaults.standard.set(value, forKey: aKey)
    }
    static func string(forKey key: defaultKeys) -> String? {
        let aKey = key.rawValue
        return UserDefaults.standard.string(forKey: aKey)
        
       
    }
    static func data(forKey key: defaultKeys) -> Data? {
        let aKey = key.rawValue
        return UserDefaults.standard.data(forKey: aKey)
    }
}


