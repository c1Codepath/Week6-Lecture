//
//  ManyPicturesViewController.swift
//  Week6-Lecture
//
//  Created by Salyards, Adey on 5/3/16.
//  Copyright © 2016 Salyards, Adey. All rights reserved.
//

import UIKit

class ManyPicturesViewController: UIViewController {

    var selectedImage: UIImageView!
    var imageTransition: ImageTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageTransition = ImageTransition()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(sender: UITapGestureRecognizer) {
        
        selectedImage = sender.view as! UIImageView
        
        performSegueWithIdentifier("pictureSegue", sender: selectedImage)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let pictureViewController = segue.destinationViewController as! PictureViewController
        
        pictureViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        pictureViewController.transitioningDelegate = imageTransition
        
        pictureViewController.view.layoutIfNeeded()
        
        pictureViewController.imageView.image = sender!.image
        
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
    
    
}
