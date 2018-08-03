//
//  HttpTools.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/2/28.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import Alamofire
import Moya

class HttpTools {
    //创建单例
    static let shareInstance:HttpTools = {
        let tools = HttpTools()
        return tools
    }()
    
}

///错误码 根据自家后台数据确定
let NET_STATE_CODE_SUCCESS = 1
let NET_STATE_CODE_LOGIN = -1
let NET_STATE_CODE_ERROR = 0


class TBaseModel: Decodable {
    var status: Int
    var message: String
}

class HttpRequest {
    /// 使用moya的请求封装
    ///
    /// - Parameters:
    ///   - API: 要使用的moya请求枚举（TargetType）
    ///   - target: TargetType里的枚举值
    ///   -cache: 是否缓存
    ///   - success: 成功的回调
    ///   - error: 连接服务器成功但是数据获取失败
    ///   - failure: 连接服务器失败
    
    class func loadData<T: TargetType>(API: T.Type, target: T, cache: Bool = false, success: @escaping((Data) -> Void), failure: ((Int?, String) ->Void)? ) {

        let provider = MoyaProvider<T>()

        provider.request(target) { result in
         
            switch result {
            case let .success(response):
                do {
                    
                    if target.path == "login" {
                        ApiCookies.saveCookieWith(headerFields: response.response?.allHeaderFields as! [String : String], url: (response.request?.url)!)
                    }else{
                       ApiCookies.getCookies()
                    }

                    // ***********这里可以统一处理错误码，统一弹出错误 ****
                    let _ = try response.filterSuccessfulStatusCodes()
                    let decoder = JSONDecoder()
                    let baseModel = try? decoder.decode(TBaseModel.self, from: response.data)
                    guard let model = baseModel else {
                        if let failureBlack = failure {
                            failureBlack(nil, "解析失败")
                        }
                        return
                    }
                    switch (model.status) {
                    case NET_STATE_CODE_SUCCESS :
                        success(response.data)
                        break
                    case NET_STATE_CODE_LOGIN:
                        //请重新登录
                        if let failureBlack = failure {
                            failureBlack(model.status ,model.message)
                        }
                        alertLogin(model.message)
                        break
                    case NET_STATE_CODE_ERROR:
                        //0
                        if let failureBlack = failure {
                            failureBlack(model.status ,model.message)
                        }
                        alertLogin(model.message)
                        break
                    default:
                        //其他错误
                        failureHandle(failure: failure, stateCode: nil, message: model.message)
                        break
                    }
                }
                catch let error {
                    guard let error = error as? MoyaError else { return }
                    let statusCode = error.response?.statusCode ?? 0
                    let errorCode = "请求出错，错误码：" + String(statusCode)
                    failureHandle(failure: failure, stateCode: statusCode, message: error.errorDescription ?? errorCode)
                }
            // ********************
            case .failure(_):
                failureHandle(failure: failure, stateCode: nil, message: "网络异常")
            }
        }
        
        //错误处理 - 弹出错误信息
        func failureHandle(failure: ((Int?, String) ->Void)? , stateCode: Int?, message: String) {
//            TAlert.show(type: .error, text: message)
            UIAlertController.showAlert(message: message)
            if let failureBlack = failure {
                failureBlack(nil ,message)
            }
        }
        
        //登录弹窗 - 弹出是否需要登录的窗口
        func alertLogin(_ title: String?) {
            //TODO: 跳转到登录页的操作：
        }
    }
    
}
//一次性处理的参数
public extension TargetType{
    var baseURL: URL {
        return URL(string: "http://120.77.251.70/mobile/delivery/")!
    }
    var headers: [String : String]? {
        return nil
    }
    
    var sampleData: Data {
        return "{}".data(using: String.Encoding.utf8)!
    }
    
    var method: Moya.Method {
        return .post
    }
}

extension HttpTools{
    
    func postRequest(urlString:String,params:[String:String]?,finishedCallback :  @escaping (_ result : Any) -> ()) {


        Alamofire.request(urlString, method: .post, parameters: params).responseJSON { (response) in
            //cookie
            let headerFields = response.response?.allHeaderFields as! [String:String]
            let url = response.request?.url
            ApiCookies.saveCookieWith(headerFields: headerFields, url: url!)
            
            switch response.result{
            case let .success(value):
//                let j = JSON(response.result.value)
                
                guard let dict = value as? [String: Any] else{
                    return
                }
                finishedCallback(dict)
                break
            case .failure(_):
                print(response.result.error as Any)
                break
            }
        }
        
    }
    
}
