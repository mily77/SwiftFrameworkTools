//
//  HSxPermissions.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/7/10.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import AVFoundation
import Photos
import AssetsLibrary

class HSxPermissions: NSObject {

    // MARK:- 获取相册权限
    static func authorizePhotoWith(completion:@escaping (Bool)->Void){
        let granted = PHPhotoLibrary.authorizationStatus()
        switch granted {
        case PHAuthorizationStatus.authorized:
            completion(true)
        case PHAuthorizationStatus.denied,PHAuthorizationStatus.restricted:
            completion(false)
        case PHAuthorizationStatus.notDetermined:
            PHPhotoLibrary.requestAuthorization { (status) in
                DispatchQueue.main.async {
                    completion(status == PHAuthorizationStatus.authorized ? true:false)
                }
            }
        }
        
    }
    
    // MARK:- 相机权限
    static func authorizeCameraWith(completion:@escaping (Bool)->Void) {
        let granted = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
        switch granted {
        case .authorized:
            completion(true)
            break
        case .denied:
            completion(false)
            break
        case .restricted:
            completion(false)
            break
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: AVMediaType.video) { (granted:Bool) in
                DispatchQueue.main.async {
                    completion(granted)
                }
            }
        }
    }
    
    //MARK:跳转到APP系统设置权限界面
    static func jumpToSystemPrivacySetting()
    {
        let appSetting = URL(string:UIApplicationOpenSettingsURLString)
        
        if appSetting != nil
        {
            if #available(iOS 10, *) {
                UIApplication.shared.open(appSetting!, options: [:], completionHandler: nil)
            }
            else{
                UIApplication.shared.openURL(appSetting!)
            }
        }
    }
}
