//
//  MemeCollectionViewCell.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 27/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


class MemeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var memeImageView: UIImageView!
    
    private var _memeObject: MemeObject!
    
    var memeObject: MemeObject! {
        get {
            return _memeObject
        }
        set(newValue) {
            _memeObject = newValue
            memeImageView.image = _memeObject.memeImage
        }
    }
}
