//
//  MemeTableViewController.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 24/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


class MemeTableViewController: UIViewController {

    @IBOutlet weak var addButton: UIBarButtonItem!
    
    //Injected
    var presenter: MemeTablePresenterProtocol!
    var cameraHelperProtocol: CameraHelperProtocol!
    
    
    
    //MARK: LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(cameraHelperProtocol.checkCameraAvailable() == false) {
            addButton.enabled = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: ACTIONS
    
    @IBAction func onAddImageButtonTap(sender: AnyObject) {
        
    }
    
}
