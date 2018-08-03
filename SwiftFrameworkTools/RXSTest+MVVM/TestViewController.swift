//
//  TestViewController.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/3/13.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import RxDataSources

class TestViewController: UIViewController {

//    let musicListViewModel = MusicListViewModel()
//    //负责对象销毁
//    let disposeBag = DisposeBag()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 首页背景图
        let imageView = UIImageView.init(image: UIImage.init(named: "view_bg_image.png"))
        imageView.frame = self.view.bounds
        self.view.addSubview(imageView)
        
        let imageGifArray = ["guideImage1.jpg","guideImage6.gif","guideImage7.gif","guideImage3.jpg", "guideImage5.jpg"]
//        let guideView = GuidePageView.init(images: imageGifArray, loginRegistCompletion: {
//            print("登录/注册")
//        }) {
//            print("开始使用app")
//        }
        let guideView = GuidePageView.init(frame: self.view.bounds, images: imageGifArray, isHiddenSkipBtn: false, isHiddenStartBtn: true, loginRegistCompletion: {
            print("登录/注册")
        }) {
            print("开始使用app")
        }
        
        self.view.addSubview(guideView)
        
        
        
//        self.view.addSubview(tableView)
        
//        musicListViewModel.data.bind(to: tableView.rx.items(cellIdentifier: "musicCell")){ _, music, cell in
//            cell.textLabel?.text = music.name
//            cell.detailTextLabel?.text = music.singer
//            }.disposed(by: disposeBag)
        
//        override func tableView
//
        //tableView点击响应
//        tableView.rx.modelSelected(Music.self).subscribe(onNext: { music in
//            print("你选中的歌曲信息【\(music)】")
//        }).disposed(by: disposeBag)
        
//        let dataSource = RxTableViewSectionedReloadDataSource<SectionModel>()

//        tableView.rx.setDataSource(self as! UITableViewDataSource).disposed(by: disposeBag)
        

//
    }
    
//    lazy var tableView: UITableView = {
//        let tableView = UITableView.init(frame: CGRect(x:0, y:0, width:kScreenWidth, height:kScreenHeight), style: .plain)
////        tableView.delegate = self as! UITableViewDelegate
////        tableView.dataSource = self
//        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "musicCell")
//        return tableView
//    }()
    
    
    
}

//extension TestViewController: UITableViewDataSource {
//////    返回单元格数量
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
////        return musicListViewModel.data.count
//        return 3
////    }
////
//////    返回对应的单元格
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
//        -> UITableViewCell {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "musicCell", for: indexPath)
////            let music = musicListViewModel.data[indexPath.row]
////            cell.textLabel?.text = music.name
////            cell.detailTextLabel?.text = music.singer
//            return cell
//    }
////
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//}

//extension TestViewController: UITableViewDelegate {
////    //单元格点击
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
////        print("你选中的歌曲信息【\(musicListViewModel.data[indexPath.row])】")
//    }
//}

