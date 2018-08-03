//
//  LeftDrawerViewController.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/7.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

class LeftDrawerViewController: BaseViewController,UITableViewDataSource,UITableViewDelegate {

    var titleArray = ["信息"]
    
    lazy var tableView: UITableView = {
        let tableView = UITableView.init(frame: CGRect(x:0, y:0, width:kScreenWidth,height:kScreenHeight), style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView.init()
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cellId")
        return tableView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setStatusBarBackgroundColor(color: UIColor(red:0.23, green:0.60, blue:0.93, alpha:1.00))
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.setStatusBarBackgroundColor(color: .clear)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cellId")!
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        gy_sidePushViewController(viewController: PersonalCenterViewController())
    }
    
    //定义以下方法：
    func setStatusBarBackgroundColor(color : UIColor) {
        let statusBarWindow : UIView = UIApplication.shared.value(forKey: "statusBarWindow") as! UIView
        let statusBar : UIView = statusBarWindow.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.backgroundColor = color
        }
    }
    
    

}
