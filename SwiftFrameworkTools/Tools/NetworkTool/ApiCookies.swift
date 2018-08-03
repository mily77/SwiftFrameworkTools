//
//  ApiCookies.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/1.
//  Copyright © 2018年 emily. All rights reserved.
//

import Foundation

class ApiCookies: NSObject {
    
    class func saveCookieWith(headerFields:[String:String], url:URL){
        let cookies = HTTPCookie.cookies(withResponseHeaderFields: headerFields, for: url)
        var cookieArray = [ [HTTPCookiePropertyKey : Any] ]()
        for cookie in cookies{
            cookieArray.append(cookie.properties!)
        }
        UserDefaults.standard.set(cookieArray, forKey: "cookies")
        
//        UserDefaults.CookiesInfo.set(value: cookieArray, forKey: .cookies)
    }
    
    class func getCookies(){
        if let cookieArray3 = UserDefaults.standard.array(forKey: "cookies") {
            for cookieData in cookieArray3 {
                if let dict = cookieData as? [HTTPCookiePropertyKey : Any] {
                    if let cookie = HTTPCookie.init(properties : dict) {
                        HTTPCookieStorage.shared.setCookie(cookie)
                    }
                }
            }
        }
    }
    /*
     
     let headerFields = response.response?.allHeaderFields as! [String:String]
     let url = response.request?.url
     
     */
    
}
