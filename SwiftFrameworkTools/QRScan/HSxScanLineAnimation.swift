//
//  HSxScanLineAnimation.swift
//  SwiftFrameworkTools
//
//  Created by emily on 2018/7/10.
//  Copyright © 2018年 emily. All rights reserved.
//

import UIKit

class HSxScanLineAnimation: UIImageView {
    var isAnimationing = false
    var animationRect:CGRect = CGRect.zero
    
    func startAnimatingWithRect(animationRect: CGRect, parentView: UIView, image:UIImage?) {
        self.image = image
        self.animationRect = animationRect
        parentView.addSubview(self)
        
        self.isHidden = false
        
        isAnimationing = true
        if image != nil {
            stepAnimation()
        }
    }
    
   @objc func stepAnimation() {
        if (!isAnimationing) {
            return;
        }
        var frame:CGRect = animationRect
        
        let hImg = self.image!.size.height * animationRect.size.width / self.image!.size.width
        
        frame.origin.y -= hImg
        frame.size.height = hImg
        self.frame = frame
        self.alpha = 0.0
        
        UIView.animate(withDuration: 1.2, animations: {
            self.alpha = 1.0
            var frame = self.animationRect
            let hImg = self.image!.size.height * self.animationRect.size.width / self.image!.size.width;
            
            frame.origin.y += (frame.size.height - hImg)
            frame.size.height = hImg
            
            self.frame = frame
            
        }) { (value: Bool) -> Void in
            self.perform(#selector(HSxScanLineAnimation.stepAnimation), with: nil, afterDelay: 0.3)
        }
    }
    
    func stopStepAnimating()
    {
        self.isHidden = true;
        isAnimationing = false;
    }
    
    static public func instance() ->HSxScanLineAnimation {
        return HSxScanLineAnimation()
    }
    
    deinit {
        stopStepAnimating()
    }
}
