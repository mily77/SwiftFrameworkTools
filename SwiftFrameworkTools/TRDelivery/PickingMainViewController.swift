//
//  PickingMainViewController.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/6.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PickingMainViewController: BaseViewController {

    // MARK:----lazy load
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame:self.view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        //注册UITableView，cellID为重复使用cell的Identifier
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        tableView.register(UINib.init(nibName: "PickerTableViewCell", bundle: nil), forCellReuseIdentifier: "cellID")
        tableView.tableFooterView = UIView.init()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()//初始化UI
    }
}

// MARK:-初始化UI的扩展
extension PickingMainViewController{
    ///初始化UI
    func setUpUI() {
        //3.添加到控制器view
        view.addSubview(tableView)
       
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "icon_zhanghao"), style: .plain, target: self, action: #selector(leftClick))
        
    }
    @objc func leftClick() {
        let vc = LeftDrawerViewController.init()
        gy_showSide(configuration: { (config) in
            config.animationType = .translationMask
            config.sideRelative = 0.6
            config.maskAlpha = 0.4
        }, viewController: vc)
    }
}


extension PickingMainViewController :UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = (tableView.dequeueReusableCell(withIdentifier: "cellID", for: indexPath)) as! PickerTableViewCell
        cell.selectionStyle = .none
        cell.orderButton.rx.tap.asObservable().subscribe(onNext: {
            print("\(indexPath.row)")
        }).disposed(by: cell.disposeBag)
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
