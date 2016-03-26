//
//  ActivityHelper.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 24/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit
import QuartzCore


class ActivityHelper: NSObject {
    
    //Inject
    var storageHelperProtocol: StorageHelperProtocol!
    
    var viewController: UIViewController!
    
    
    //MARK: PUBLIC
    
    func shareImage(meme: Meme) {
        let shareItems = [meme.memeImage]
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityTypePrint, UIActivityTypePostToWeibo, UIActivityTypeCopyToPasteboard, UIActivityTypeAddToReadingList, UIActivityTypePostToVimeo]
        activityViewController.completionWithItemsHandler =  {
            (activity, success, items, error) in
            self.saveMeme(meme)
        }
        
        viewController.presentViewController(activityViewController, animated: true, completion: nil)
    }

    func getImageFromView(view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
        view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let img: UIImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return img;
    }
    
    //MARK: PRIVATE
    
    func saveMeme(meme: Meme) {
        let memeObject = MemeObject(topText: meme.topText, bottomText: meme.bottomText, image: meme.image, memeImage: meme.memeImage)
        
        var memeArray = storageHelperProtocol.memes
        memeArray.append(memeObject)
        storageHelperProtocol.memes = memeArray
    }

}
