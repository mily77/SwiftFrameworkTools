//
//  HomePageViewController.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/2/26.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

class HomePageViewController: BaseViewController {
    
    @IBOutlet weak var picekerButton: UIButton!
    @IBOutlet weak var delivermanButton: UIButton!
    @IBOutlet weak var bottomLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let text = "已阅读并同意《用户协议》"
        let attributeText = NSMutableAttributedString.init(string: text)
        attributeText.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.bartBlue, range:NSRange.init(location:6, length: text.count-6))
        bottomLabel.attributedText = attributeText
        
        picekerButton.layer.cornerRadius = 10.0
        picekerButton.layer.masksToBounds = true
        
        delivermanButton.layer.cornerRadius = 10.0
        delivermanButton.layer.masksToBounds = true
        
        view.backgroundColor = UIColor.white
        
    
    }
    @IBAction func picekerButtonAction(_ sender: UIButton) {
        print("1234")
        let pickerVC = PickerLoginViewController.init(nibName: "PickerLoginViewController", bundle: nil)
        navigationController?.pushViewController(pickerVC, animated: true)
    }
    @IBAction func delivermanButtonAction(_ sender: UIButton) {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
       super.viewWillAppear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(UIImage.init(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage.init()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationController?.navigationBar.shadowImage = nil
    }

}

extension UIColor{
    class var bartBlue: UIColor {
        return UIColor.init(red: 43/255.0, green: 156/255.0, blue: 237/255.0, alpha: 1.0)
    }
}
