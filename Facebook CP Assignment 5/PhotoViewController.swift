//
//  PhotoViewController.swift
//  Facebook CP Assignment 5
//
//  Created by Jess Lam on 3/2/16.
//  Copyright © 2016 Jess Lam. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    
    @IBOutlet weak var weddingImageView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var photoScroll: UIScrollView!
    @IBOutlet weak var blackView: UIView!
    
    
    var image: UIImageView!
    var targetOriginalCenter: CGPoint!
    
    var imageTransition: ImageTransition!
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        weddingImageView.image = image.image
        
        //Scroll horizontally between images
        photoScroll.delegate = self
//        photoScroll.contentSize = CGSizeMake(1600, weddingImageView.image!.size.height)
//        
//        var scrollViewWidth = photoScroll.frame.width

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didPressDone(sender: AnyObject) {        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    @IBAction func didPanPhoto(sender: UIPanGestureRecognizer) {
        
        let translation = sender.translationInView(view)
        let velocity = sender.velocityInView(view)
        
         
        if sender.state == UIGestureRecognizerState.Began {
            targetOriginalCenter = weddingImageView.center
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.doneButton.alpha = 0
            })
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            weddingImageView.center = CGPoint(x: targetOriginalCenter.x + translation.x, y: targetOriginalCenter.y + translation.y)
            
            if translation.y > 0 {
                blackView.backgroundColor = UIColor(white: 0, alpha: (50 / translation.y))
                print(view.backgroundColor)
            } else if translation.y < 0 {
                blackView.backgroundColor = UIColor(white: 0, alpha: (50 / translation.y * -1))
            }
            
        } else if sender.state == UIGestureRecognizerState.Ended {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.doneButton.alpha = 1
            })
            if translation.y > 100 {
                dismissViewControllerAnimated(true, completion: nil)
            } else if translation.y < -100 {
                dismissViewControllerAnimated(true, completion: nil)
            } else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.weddingImageView.center = self.targetOriginalCenter
                    self.view.backgroundColor = UIColor(white: 0, alpha: 1)
                })
            }
            
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView!) -> UIView! {
        return weddingImageView
    }
    
 
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
