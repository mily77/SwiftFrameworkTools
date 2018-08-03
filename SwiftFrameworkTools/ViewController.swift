//
//  ViewController.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/2/5.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView: UITableView!
    
    var arraryItems:Array<Array<String>> = [
        ["模拟qq扫码界面","qqStyle"],
        ["模仿支付宝扫码区域","ZhiFuBaoStyle"],
        ["模仿微信扫码区域","weixinStyle"],
        ["无边框，内嵌4个角","InnerStyle"],
        ["4个角在矩形框线上,网格动画","OnStyle"],
        ["自定义颜色","changeColor"],
        ["只识别框内","recoCropRect"],
        ["改变尺寸","changeSize"],
        ["条形码效果","notSquare"],
        ["二维码/条形码生成","myCode"],
        ["相册","openLocalPhotoAlbum"]
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        self.title = "swift 扫一扫"
        tableView.delegate = self
        tableView.dataSource  = self
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        view.addSubview(tableView)
    }

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arraryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = arraryItems[indexPath.row].first
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
