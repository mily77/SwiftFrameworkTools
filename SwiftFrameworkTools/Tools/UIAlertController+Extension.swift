//
//  UIAlertController+Extension.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/12.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

extension UIAlertController {
    //在指定视图控制器上弹出普通消息提示框
    static func showAlert(message: String, in viewController: UIViewController) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "确定", style: .cancel))
        viewController.present(alert, animated: true)
    }
    
    //在根视图控制器上弹出普通消息提示框
    static func showAlert(message: String) {
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            showAlert(message: message, in: vc)
        }
    }
    
    //在指定视图控制器上弹出确认框
    static func showConfirm(message: String, in viewController: UIViewController,
                            confirm: ((UIAlertAction)->Void)?) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel))
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: confirm))
        viewController.present(alert, animated: true)
    }
    
    //在根视图控制器上弹出确认框
    static func showConfirm(message: String, confirm: ((UIAlertAction)->Void)?) {
        if let vc = UIApplication.shared.keyWindow?.rootViewController {
            showConfirm(message: message, in: vc, confirm: confirm)
        }
    }
    //在指定视图控制器上弹出确认框后设置时间提示框自动消失
    static func showAlert(message :String, time:Double, in viewController: UIViewController) {
        let alertController = UIAlertController(title: nil,
                                                message: message, preferredStyle: .alert)
        //显示提示框
        viewController.present(alertController, animated: true, completion: nil)
        //多久后自动消失（单位 seconds）
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + time) {
            //移除提示框
            viewController.presentedViewController?.dismiss(animated: false, completion: nil)
        }
    }
    
}


