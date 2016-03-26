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
    var storageHelperProtocol: StorageHelperProtocol!
    var controllerAssembly: ControllerAssembly!
    
    //MARK: LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: ACTIONS
    
    @IBAction func onAddImageButtonTap(sender: AnyObject) {
        let generateNavigationController: UINavigationController = controllerAssembly.generateNavigationController() as! UINavigationController
        navigationController?.presentViewController(generateNavigationController, animated: true, completion: nil)
    }
    
    
    
}


extension MemeTableViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 90.0
    }
    
}

extension MemeTableViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storageHelperProtocol.memes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MemeTableViewCell = tableView.dequeueReusableCellWithIdentifier("MemeTableViewCell", forIndexPath: indexPath) as! MemeTableViewCell
        cell.memeObject = storageHelperProtocol.memes[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let detailViewController: DetailViewController = controllerAssembly.detailViewController() as! DetailViewController
        detailViewController.memeObject = storageHelperProtocol.memes[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
}





