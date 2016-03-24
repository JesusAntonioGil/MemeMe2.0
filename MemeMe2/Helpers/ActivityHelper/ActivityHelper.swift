//
//  ActivityHelper.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 24/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


class ActivityHelper: NSObject, ActivityHelperProtocol {
    
    var viewController: UIViewController!
    
    
    //MARK: PUBLIC
    
    func shareImage(meme: Meme) {
        let shareItems = [meme.memeImage]
        let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: shareItems, applicationActivities: nil)
        activityViewController.excludedActivityTypes = [UIActivityTypePrint, UIActivityTypePostToWeibo, UIActivityTypeCopyToPasteboard, UIActivityTypeAddToReadingList, UIActivityTypePostToVimeo]
        activityViewController.completionWithItemsHandler =  {
            (activity, success, items, error) in
        }
        
        viewController.presentViewController(activityViewController, animated: true, completion: nil)
    }

}
