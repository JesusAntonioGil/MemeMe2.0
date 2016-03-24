//
//  StorageHelper.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 24/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


private let kNSUserDefaultsMemesKey: String = "NSUserDefaultsMemesKey"


class StorageHelper: NSObject, StorageHelperProtocol {

    //Injected
    var userDefaults: NSUserDefaults!
    
    var memes: [MemeObject] {
        get {
            if let memesData: AnyObject = userDefaults.objectForKey(kNSUserDefaultsMemesKey) {
                if let memeArray : AnyObject = NSKeyedUnarchiver.unarchiveObjectWithData(memesData as! NSData) {
                    return memeArray as! [MemeObject]
                }
            }
                
            return []
        }
        
        set(memeArray) {
            let memesData = NSKeyedArchiver.archivedDataWithRootObject(memeArray)
            userDefaults.setObject(memesData, forKey: kNSUserDefaultsMemesKey)
            userDefaults.synchronize()
        }
    }
    
}
