//
//  Meme.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 24/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


struct Meme {
    var topText: String
    var bottomText: String
    var image: UIImage
    var memeImage: UIImage
}


class MemeObject: NSObject, NSCoding {
    
    var topText: String
    var bottomText: String
    var image: UIImage
    var memeImage: UIImage
    
    
    init(topText: String, bottomText: String, image: UIImage, memeImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.image = image
        self.memeImage = memeImage
    }
    
    required init?(coder aDecoder: NSCoder) {
        topText = aDecoder.decodeObjectForKey("memeObjectTopText") as! String
        bottomText = aDecoder.decodeObjectForKey("memeObjectBottomText") as! String
        image = UIImage(data: aDecoder.decodeObjectForKey("memeObjectImage") as! NSData)!
        memeImage = UIImage(data: aDecoder.decodeObjectForKey("memeObjectMemeImage") as! NSData)!
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(topText, forKey: "memeObjectTopText")
        aCoder.encodeObject(bottomText, forKey: "memeObjectBottomText")
        aCoder.encodeObject(UIImageJPEGRepresentation(image, 0.5), forKey: "memeObjectImage")
        aCoder.encodeObject(UIImageJPEGRepresentation(memeImage, 0.5), forKey: "memeObjectMemeImage")
    }
}

