//
//  BlueViewController.swift
//  Week6-Lecture
//
//  Created by Salyards, Adey on 5/3/16.
//  Copyright © 2016 Salyards, Adey. All rights reserved.
//

import UIKit

class BlueViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var fadeTransition: FadeTransition!
    var lightboxTransition: LightboxTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fadeTransition = FadeTransition()
        fadeTransition.duration = 3
        
        lightboxTransition = LightboxTransition()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onPinch(sender: UIPinchGestureRecognizer) {
        let scale = sender.scale
        let velocity = sender.velocity
        if sender.state == UIGestureRecognizerState.Began {
            lightboxTransition.isInteractive = true
            performSegueWithIdentifier("graySegue", sender: nil)
        }else if sender.state == UIGestureRecognizerState.Changed {
            lightboxTransition.percentComplete = scale / 8
        }else if sender.state == UIGestureRecognizerState.Ended {
            if velocity > 0 {
                lightboxTransition.finish()
            } else {
                lightboxTransition.cancel()
            }
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let destinationViewController = segue.destinationViewController as! GrayViewController
        
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationViewController.transitioningDelegate = lightboxTransition
        
        destinationViewController.labelString = textField.text
        
    }
    

}
