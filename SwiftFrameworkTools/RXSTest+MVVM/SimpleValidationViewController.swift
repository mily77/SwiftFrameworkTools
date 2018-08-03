//
//  SimpleValidationViewController.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/5/25.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

fileprivate let minimalUsernameLength = 5
fileprivate let minimalPasswordLength = 5

class SimpleValidationViewController: UIViewController {

    // 负责对象销毁
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var usernameValidLabel: UILabel!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var passwordValidLabel: UILabel!
    @IBOutlet weak var doSomethingButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        //viewmodel 初始化
        let viewModel = LoginViewModel.init(input: (username: usernameTF.rx.text.orEmpty.asDriver(), password: passwordTF.rx.text.orEmpty.asDriver(), loginTaps: doSomethingButton.rx.tap.asDriver()), service: ValidationService.instance)
        viewModel.userNameUsable.drive(usernameValidLabel.rx.validationResult).disposed(by: disposeBag)
        viewModel.userPasswordAble.drive(passwordValidLabel.rx.validationResult).disposed(by: disposeBag)
        
        viewModel.loginButtonEnabled.drive(onNext: { [weak self] (valid) in
            self?.doSomethingButton.isEnabled = valid
            self?.doSomethingButton.alpha = valid ? 1.0 : 0.5
        }).disposed(by: disposeBag)
        
        viewModel.loginResult.drive(onNext: { [weak self](result) in
            switch result {
            case let .ok(message):
//                self?.performSegue(withIdentifier: "showListSegue", sender: nil)
                self?.showAlert(message: message)
            case .empty:
                self?.showAlert(message: "")
            case let .failed(message):
                self?.showAlert(message: message)
            }
        }).disposed(by: disposeBag)

//        // 用户名是否有效
////        let usernameValid = usernameTF.rx.text.orEmpty
////            // 用户名 -> 用户名是否有效
////            .map { $0.count >= minimalUsernameLength }
////            .share(replay: 1)
//        let usernameValid:Observable = usernameTF.rx.text.orEmpty.map { (value) in
//            value.count >= minimalUsernameLength
//        }.share(replay: 1)
//
//        // 密码是否有效
//        let passwordValid = passwordTF.rx.text.orEmpty
//            // 密码 ->密码是否有效
//            .map { $0.count >= minimalPasswordLength }
//            .share(replay: 1)
//
//        // 用户名是否有效 -> 用户名提示语是否隐藏
//        usernameValid
//            .bind(to: usernameValidLabel.rx.isHidden)
//            .disposed(by: disposeBag)
//
//        // 用户名是否有效 -> 密码输入框是否可用
//        usernameValid
//            .bind(to: passwordTF.rx.isEnabled)
//            .disposed(by: disposeBag)
//
//        // 密码是否有效 -> 密码提示语是否隐藏
//        passwordValid.bind(to: passwordValidLabel.rx.isHidden).disposed(by: disposeBag)
//
//
////        // 所有输入是否有效(登录按钮的是否可用)
////        let everythingValid = Observable.combineLatest(
////            usernameValid,
////            passwordValid
////        ) { $0 && $1 } // 取用户名和密码同时有效
////        .share(replay: 1)
//        let everythingValid = Observable.combineLatest(usernameValid,passwordValid){(account, password) in
//            account && password
//            }.share(replay: 1)
//        // 所有输入是否有效 -> 按钮是否可点击 绑定按钮
//        everythingValid.bind(to: doSomethingButton.rx.isEnabled).disposed(by: disposeBag)
//        everythingValid.subscribe(onNext: { [unowned self ] valid in
//            self.doSomethingButton.alpha = valid ? 1 : 0.5
//        }).disposed(by: disposeBag)
        
        // 点击按钮 -> 弹出提示框
//        doSomethingButton.rx.tap.subscribe(onNext:{ [weak self] in
//            self?.showAlert()
//
//        }).disposed(by: disposeBag)
        
//        doSomethingButton.rx.tap
//            .asObservable()
//            .withLatestFrom(everythingValid)
//            .do(onNext: {
//                [unowned self]_ in
//                self.doSomethingButton.isEnabled = false
//                self.view.endEditing(true)
//            })
//            .subscribeOn(MainScheduler.instance)//主线程
//            .subscribe(onNext: {[unowned self]isLogin in
//                self.showAlert()
//                self.doSomethingButton.isEnabled = true
//            }).disposed(by: disposeBag)//开始释放

    }
    

    func showAlert(message:String) {
        let action = UIAlertAction(title: "确定", style: .default, handler: nil)
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}
