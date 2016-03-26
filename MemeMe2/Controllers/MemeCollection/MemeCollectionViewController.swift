//
//  MemeCollectionViewController.swift
//  MemeMe2
//
//  Created by Jesus Antonio Gil on 27/3/16.
//  Copyright © 2016 Jesus Antonio Gil. All rights reserved.
//

import UIKit


class MemeCollectionViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //Injected
    var storageHelperProtocol: StorageHelperProtocol!
    var controllerAssembly: ControllerAssembly!
    
    
    //MARK: LIFE CYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        collectionView.reloadData()
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


extension MemeCollectionViewController: UICollectionViewDelegate {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        collectionView.deselectItemAtIndexPath(indexPath, animated: true)
        
        let detailViewController: DetailViewController = controllerAssembly.detailViewController() as! DetailViewController
        detailViewController.memeObject = storageHelperProtocol.memes[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension MemeCollectionViewController: UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storageHelperProtocol.memes.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: MemeCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionViewCell", forIndexPath: indexPath) as! MemeCollectionViewCell
        cell.memeObject = storageHelperProtocol.memes[indexPath.row]
        
        return cell
    }
    
    
    
}