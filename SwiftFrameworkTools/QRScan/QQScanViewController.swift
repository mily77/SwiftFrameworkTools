//
//  QQScanViewController.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/8/7.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

class QQScanViewController: UIViewController {

    /**
     @brief  扫码区域上方提示文字
     */
    var topTitle:UILabel?
    
    /**
     @brief  闪关灯开启状态
     */
    var isOpenedFlash:Bool = false
    
    // MARK: - 底部几个功能：开启闪光灯、相册、我的二维码
    
    //底部显示的功能项
    var bottomItemsView:UIView?
    
    //相册
    var btnPhoto:UIButton = UIButton()
    
    //闪光灯
    var btnFlash:UIButton = UIButton()
    
    //我的二维码
    var btnMyQR:UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
