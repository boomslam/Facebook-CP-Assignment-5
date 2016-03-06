//
//  ImageTransition.swift
//  Facebook CP Assignment 5
//
//  Created by Jess Lam on 3/4/16.
//  Copyright © 2016 Jess Lam. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let movingImageView = UIImageView()
        
        let feedViewController = fromViewController as! FeedViewController
        let photoViewController = toViewController as! PhotoViewController
        let destinationImageFrame = photoViewController.weddingImageView.frame
        
        //cloning the view
        movingImageView.frame = feedViewController.selectedImageView.frame
        movingImageView.image = feedViewController.selectedImageView.image
        movingImageView.clipsToBounds = feedViewController.selectedImageView.clipsToBounds
        movingImageView.contentMode = feedViewController.selectedImageView.contentMode
        
        containerView.addSubview(movingImageView)
        
        //Subtract offset from scrollview in case it has changed
        movingImageView.frame.origin.y -= feedViewController.feedScrollView.contentOffset.y
        
        //Hide initial and final images
        feedViewController.selectedImageView.hidden = true
        photoViewController.weddingImageView.hidden = true
        
        UIView.animateWithDuration(duration, animations: {
    
            
            
            photoViewController.weddingImageView.alpha = 1
            movingImageView.frame = destinationImageFrame
            
            //Sets newly created image view frame to the destination frame
            //movingImageView.frame = photoViewController.weddingImageView.frame
            
            }) { (finished: Bool) -> Void in
                
                movingImageView.hidden = true
                photoViewController.weddingImageView.hidden = false
                
                //feedViewController.selectedImageView.alpha = 1
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        //movingImageView.removeFromSuperview()
        
        let movingImageView = UIImageView()
        
        //Switch from and to view controllers and the destination image frame to dismiss
        let feedViewController = toViewController as! FeedViewController
        let photoViewController = fromViewController as! PhotoViewController
        var destinationImageFrame = feedViewController.selectedImageView.frame
        
        //cloning the view
        movingImageView.frame = photoViewController.weddingImageView.frame
        movingImageView.image = photoViewController.weddingImageView.image
        movingImageView.clipsToBounds = photoViewController.weddingImageView.clipsToBounds
        movingImageView.contentMode = photoViewController.weddingImageView.contentMode
        
        containerView.addSubview(movingImageView)
        
        //Subtract offset from scrollview in case it has changed
        destinationImageFrame.origin.y -= feedViewController.feedScrollView.contentOffset.y
        
        //Hide initial and final images
        feedViewController.selectedImageView.hidden = true
        photoViewController.weddingImageView.hidden = true
        
//        fromViewController.view.alpha = 1
        
        UIView.animateWithDuration(duration, animations: {
            
            movingImageView.frame = destinationImageFrame
            fromViewController.view.alpha = 0
            
            }) { (finished: Bool) -> Void in
                movingImageView.hidden = true
                feedViewController.selectedImageView.hidden = false
                self.finish()
        }
    }

}
