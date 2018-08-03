//
//  HSXTextField.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/2/27.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

class HSXTextField: UITextField {
    
    //swift的二次构造
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
    //便利构造 重写 init方法
//    convenience  init( leftView: UIView?,frame: CGRect, rightView: UIView?, color:UIColor?,boardWidth:CGFloat,boardRadius : CGFloat)
//    {
//        var color = color
//        let rightView = rightView
//        let leftView = leftView
//        self.init(frame:frame)
//        self.leftViewMode = UITextFieldViewMode.always
//        self.leftViewMode = UITextFieldViewMode.always
//        self.leftView = leftView
//        self.rightView = rightView
//        if color == nil
//        {
//            //默认一个颜色
//            color = UIColor(red: 0.2588, green: 0.7490, blue: 0.6471, alpha: 1)
//        }
//        self.layer.borderColor = color?.cgColor
//        //边框宽度
//        self.layer.borderWidth = boardWidth
//        self.layer.masksToBounds = true
//        //边框圆角
//        self.layer.cornerRadius = boardRadius
//    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        var iconRect = super.leftViewRect(forBounds: bounds)
        iconRect.origin.x += 10;// 右偏10
        return iconRect;
    }
    
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var iconRect = super.rightViewRect(forBounds: bounds)
        iconRect.origin.x -= 10;
        return iconRect
        
    }
    
    
    
//    required init(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
}

