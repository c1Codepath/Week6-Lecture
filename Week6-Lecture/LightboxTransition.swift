//
//  LightboxTransition.swift
//  Week6-Lecture
//
//  Created by Salyards, Adey on 5/3/16.
//  Copyright © 2016 Salyards, Adey. All rights reserved.
//

import UIKit

class LightboxTransition: BaseTransition {
    
    let blackView = UIView()

    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        blackView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        blackView.frame = fromViewController.view.frame
        
        fromViewController.view.addSubview(blackView)
        
        blackView.alpha = 0
        toViewController.view.alpha = 0
        toViewController.view.transform = CGAffineTransformMakeScale(0, 0)
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            self.blackView.alpha = 1
            toViewController.view.transform = CGAffineTransformMakeScale(0.8, 0.8)
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        blackView.removeFromSuperview()
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            fromViewController.view.transform = CGAffineTransformMakeScale(0.001, 0.001)
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }

    
}
