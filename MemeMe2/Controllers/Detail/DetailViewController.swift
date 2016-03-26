//
//  DetailViewController.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 26/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


class DetailViewController: UIViewController {

    @IBOutlet weak var memeImageView: UIImageView!
    
    var memeObject: MemeObject!
    
    
    //MARK: LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        memeImageView.image = memeObject.memeImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
