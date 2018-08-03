//
//  PersonalCenterViewController.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/7.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

class PersonalCenterViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let logoutButton = UIButton.init(type: UIButtonType.custom)
        logoutButton.frame = CGRect(x:20, y:kScreenHeight-60, width:kScreenWidth-40, height:40)
        logoutButton.setTitle("退出登录", for: .normal)
        logoutButton.backgroundColor = UIColor.red
        view.addSubview(logoutButton)
        
        logoutButton.addTarget(self, action: #selector(logoutButtonAction), for: .touchUpInside)
    }
    
    @objc func logoutButtonAction() {
        UIAlertController.showAlert(message: "YES", time: 3, in: self)
    }
}
