//
//  PickerLoginViewController.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/2/27.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import Alamofire

class PickerLoginViewController: BaseViewController {

    @IBOutlet weak var userNameTF: HSXTextField!
    @IBOutlet weak var passWordTF: HSXTextField!
    @IBOutlet weak var loginButton: UIButton!
    
    var model:LoginModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
        self.navigationItem.title = "拣货员登录"
        loginButton.layer.cornerRadius = 10.0
        loginButton.layer.masksToBounds = true
        
        let userImgView = UIImageView.init(image: UIImage.init(named: "icon_zhanghao"))
        let passwordImgView = UIImageView.init(image: UIImage.init(named: "icon_zhanghao"))
        
        userNameTF.leftViewMode = .always
        userNameTF.leftView = userImgView
        
        passWordTF.leftViewMode = .always
        passWordTF.leftView = passwordImgView
        
    }
    
    @IBAction func loginButtonAction(_ sender: UIButton) {
        print("login action")
        
        if userNameTF.text?.count == 0 {
            print("账号不能为空")
        }else if passWordTF.text?.count == 0 {
            print("密码不能为空")
        }else{
            HttpRequest.loadData(API: APIManager.self, target: .getLogin(userName: userNameTF.text!, password: passWordTF.text!, type: 1), success: { (json) in
                // swift4.0自带json转model
                let decoder = JSONDecoder()
                let model = try? decoder.decode(LoginModel.self, from: json)
                self.model = model
                
                UserDefaults.LoginInfo.set(value: "pickerLogined", forKey: .pickerLogined)
                
                UserDefaults.AccountInfo.set(value: NSKeyedArchiver.archivedData(withRootObject: json), forKey: .userInfo)
                
                let pickerMian = PickingMainViewController()
                self.navigationController?.pushViewController(pickerMian, animated: true)
                
                
                
            }) { (error_code, message) in
                print(message)
            }
        }
        
       

        
//        var params = [String:String]()
//        params["account"] = userNameTF.text
//        params["Password"] = passWordTF.text
//        params["type"] = "1"
//        Alamofire.request("http://120.77.251.70/mobile/delivery/login", method: .post, parameters: params).responseJSON { (response) in
//            print("-----\(response.result.value ?? "abcd")")
////            self.model = try! JSONDecoder().decode(LoginModel.self, from: response.result.value as! Data)
//            self.model = try? JSONDecoder().decode(LoginModel.self, from: response.data!)

//        }

    }
    
}

