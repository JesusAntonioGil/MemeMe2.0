//
//  MemeTableViewCell.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 26/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


class MemeTableViewCell: UITableViewCell {

    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    private var _memeObject: MemeObject!
    
    var memeObject: MemeObject! {
        get {
            return _memeObject
        }
        set(newValue) {
            _memeObject = newValue
            memeImageView.image = _memeObject.memeImage
            titleLabel.text = _memeObject.topText
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
