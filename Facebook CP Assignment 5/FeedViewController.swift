//
//  FeedViewController.swift
//  Facebook CP Assignment 5
//
//  Created by Jess Lam on 3/2/16.
//  Copyright © 2016 Jess Lam. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    @IBOutlet weak var feedScrollView: UIScrollView!
    @IBOutlet weak var feedImage: UIImageView!
    
    //property to track whether vc is being presented or dismissed
    //    var isPresenting: Bool = true
    
    var selectedImageView: UIImageView!
    
    var imageTransition: ImageTransition!
    
    //Getting the key window. Retrieve window that is created in storyboard
    //    var window = UIApplication.sharedApplication().keyWindow
    //
    //    var frame = window.convertRect(imageView.frame, fromView: containerView)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedScrollView.contentSize = CGSizeMake(320, feedImage.image!.size.height)
        
        imageTransition = ImageTransition()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func didTapImage(sender: UITapGestureRecognizer) {
        
        print("did tap")
        
        //Make sure this is above the perform segue. as! lets us store ui image in variable
        selectedImageView = sender.view as! UIImageView
        
        //trigger segue on tap
        performSegueWithIdentifier("photoSegue", sender: nil)
        
    }
    
    
    
    //transition delegate methods
    //    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    //        isPresenting = true
    //        return self
    //    }
    //
    //    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    //        isPresenting = false
    //        return self
    //    }
    //
    //    //method that controls the transition
    //    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
    //        // The value here should be the duration of the animations scheduled in the animationTransition method
    //        return 0.4
    //    }
    
    //Controls custom transition
    //    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
    //
    //        print("animating transition")
    //        let containerView = transitionContext.containerView()!
    //        let toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
    //        let fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
    //
    //        if (isPresenting) {
    //            containerView.addSubview(toViewController.view)
    //            toViewController.view.alpha = 0
    //            UIView.animateWithDuration(0.4, animations: { () -> Void in
    //                toViewController.view.alpha = 1
    //                }, completion: { (Bool) -> Void in
    //                    transitionContext.completeTransition(true)
    //            })
    //        }   else {
    //            UIView.animateWithDuration(0.4, animations: { () -> Void in
    //                fromViewController.view.alpha = 0
    //                }, completion: { (Bool) -> Void in
    //                    transitionContext.completeTransition(true)
    //                    //need to fix this
    //                    //fromViewController.removeFromSuperview()
    //            })
    //
    //        }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        feedScrollView.contentInset.top = 0
//        feedScrollView.contentInset.bottom = 50
//        feedScrollView.scrollIndicatorInsets.top = 0
//        feedScrollView.scrollIndicatorInsets.bottom = 50
//    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        //access the destination vc
        let photoViewController = segue.destinationViewController as! PhotoViewController
        
        //Do my custom transition
        photoViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        photoViewController.transitioningDelegate = imageTransition
        
        imageTransition.duration = 0.3
        
        //fixes error
        photoViewController.view.layoutIfNeeded()
        
        //sets image in from vc to the selected image
        photoViewController.weddingImageView.image = selectedImageView.image
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    
}
//}