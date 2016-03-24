//
//  MemeTableViewController.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 24/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


class MemeTableViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIBarButtonItem!
    
    //Injected
    var presenter: MemeTablePresenterProtocol!
    
    
    //MARK: LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: ACTIONS
    
    @IBAction func onAddImageButtonTap(sender: AnyObject) {
        
    }
    
}


extension MemeTableViewController: UITableViewDelegate {
    
    
}

extension MemeTableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}





