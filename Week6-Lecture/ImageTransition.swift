//
//  ImageTransition.swift
//  Week6-Lecture
//
//  Created by Salyards, Adey on 5/3/16.
//  Copyright © 2016 Salyards, Adey. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {

    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        var movingImage = UIImageView()
        
        let manyPicturesViewController = fromViewController as! ManyPicturesViewController
        let pictureViewController = toViewController as! PictureViewController
        
        movingImage.image = manyPicturesViewController.selectedImage.image
        movingImage.frame = manyPicturesViewController.selectedImage.frame
        movingImage.clipsToBounds = manyPicturesViewController.selectedImage.clipsToBounds
        movingImage.contentMode = manyPicturesViewController.selectedImage.contentMode
        
        containerView.addSubview(movingImage)
        
        toViewController.view.alpha = 0
        pictureViewController.imageView.alpha = 0
        UIView.animateWithDuration(duration, animations: {
                    movingImage.frame = pictureViewController.imageView.frame
            toViewController.view.alpha = 1
        }) { (finished: Bool) -> Void in
            pictureViewController.imageView.alpha = 1
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
        }) { (finished: Bool) -> Void in
            self.finish()
        }
    }

    
}
