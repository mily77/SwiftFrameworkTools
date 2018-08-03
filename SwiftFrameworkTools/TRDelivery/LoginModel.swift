//
//  LoginModel.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/2.
//  Copyright © 2018年 emily. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation
// To parse the JSON, add this file to your project and do:
//
//   let loginModel = try? JSONDecoder().decode(LoginModel.self, from: jsonData)

import Foundation

struct LoginModel: Codable {
    let message: String
    let status: Int
    let data: LoginModelData
}

struct LoginModelData: Codable {
    let userInfo: UserInfo
}

struct UserInfo: Codable {
    let account: String
    let addTime, id: Int
    let mobile, name, password: String
    let shopID, type: Int
    
    enum CodingKeys: String, CodingKey {
        case account, addTime, id, mobile, name, password
        case shopID = "shopId"
        case type
    }
}

