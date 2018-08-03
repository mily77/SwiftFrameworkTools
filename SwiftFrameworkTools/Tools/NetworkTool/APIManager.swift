//
//  APIManager.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/5.
//  Copyright © 2018年 emily. All rights reserved.
//

import Foundation
import Moya

enum APIManager {
    case getLogin(userName:String, password:String, type:Int)
    case getSubList
    case getLogout
}

extension APIManager: TargetType{
    var path: String {
        switch self {
        case .getLogin:
            return "login"
            
        case .getSubList:
            return "subList"
            
        case .getLogout:
            return "logout"
            
        }
    }
    
    var task: Task {
        var params:[String: Any] = [:]
        switch self {
        case let .getLogin(userName, password, type):
            params["account"] = userName
            params["Password"] = password
            params["type"] = type

        default:
            return .requestPlain
        }
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
    
}
